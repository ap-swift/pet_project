//
//  GameViewController.swift
//  LanguageCards
//
//  Created by Артем Парфенов on 24.01.2024.
//

import UIKit
import CoreData

class GameViewController: UIViewController {

    var myView: GameView!
    var gameViewModel: GameViewModel!
    var cardIndex = 0
    var arrayOfCards: [CardStruct] = []
    var score: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(hex: "79D5CA")

        myView = GameView(view: view, gameViewController: self)
        gameViewModel = GameViewModel()
        gameViewModel.addAllCards()
        showCardsText()

        swipeRight()
        swipeLeft()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myView.addFrames()
//        1. действие изменяющее layout
//        2. self.setNeedsLayout() команда для пересчета layout для текущего UIView и его Subviews
//        3. self.layoutIfNeeded() метод для немедленной перерисовки макета, используется если есть setNeedsLayout() или updateConstraints()
    }

    func showCardsText() {
        arrayOfCards = gameViewModel.arrayOfCards()
        arrayOfCards.shuffle()
        myView.topText.text = arrayOfCards[0].englishSentence
        myView.cardText.text = arrayOfCards[0].spanishSentence
    }


    @objc func yesButtonAnimation() {
        myView.buttonYes.isUserInteractionEnabled = false
        if arrayOfCards[cardIndex].isTrue == true {
            score = score + 5
        } else {
            score = score - 5
        }
        UIView.animate(withDuration: 0.5, animations: { [self] in
            self.myView.cardView.frame.origin.x = UIScreen.main.bounds.width
            self.myView.cardText.frame.origin.x = UIScreen.main.bounds.width
        }, completion: { [self] _ in
            self.myView.cardView.frame.origin.x = 70
            self.myView.cardText.frame.origin.x = 70
            cardIndex += 1
            if cardIndex == arrayOfCards.endIndex {
                myView.buttonYes.isUserInteractionEnabled = false
                endCardsPopAlert()
                addGameResultToHistory()
                print("Закончились карточки, возврат на предыдущий экран")
                return
            }
            myView.topText.text = arrayOfCards[cardIndex].englishSentence
            myView.cardText.text = arrayOfCards[cardIndex].spanishSentence
            myView.buttonYes.isUserInteractionEnabled = true
        })
        print("Нажал на ДА")
    }

    @objc func noButtonAnimation() {
        myView.buttonNo.isUserInteractionEnabled = false
        if arrayOfCards[cardIndex].isTrue == false {
            score = score + 5
        } else {
            score = score - 5
        }
        UIView.animate(withDuration: 0.5, animations: { [self] in
            self.myView.cardView.frame.origin.x = -UIScreen.main.bounds.width
            self.myView.cardText.frame.origin.x = -UIScreen.main.bounds.width
        }, completion: { [self] _ in
            self.myView.cardView.frame.origin.x = 70
            self.myView.cardText.frame.origin.x = 70
            cardIndex += 1
            if cardIndex == arrayOfCards.endIndex {
                myView.buttonNo.isUserInteractionEnabled = false
                endCardsPopAlert()
                addGameResultToHistory()
                print("Закончились карточки, возврат на предыдущий экран")
                return
            }
            myView.topText.text = arrayOfCards[cardIndex].englishSentence
            myView.cardText.text = arrayOfCards[cardIndex].spanishSentence
            myView.buttonNo.isUserInteractionEnabled = true
        })
        print("Нажал на НЕТ")
    }

    func endCardsPopAlert() {
        let alertController = UIAlertController(title: "Game over", message: "Your score: \(score)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.navigationController?.popViewController(animated: true)
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }

    func addGameResultToHistory() {
        Storage.addObject(object: ContentCell(title: TypeNameViewController.userName!, score: String(score)))
    }

}



extension GameViewController {

    func swipeRight() {
        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeRightGesture.direction = .right
        view.addGestureRecognizer(swipeRightGesture)
    }

    func swipeLeft() {
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeLeftGesture.direction = .left
        view.addGestureRecognizer(swipeLeftGesture)
    }

    // Обработчик жестов смахивания
    @objc func handleSwipe(_ gesture: UISwipeGestureRecognizer) {
        switch gesture.direction {
        case .right:
            print("Swipe Right")
            yesButtonAnimation()
        case .left:
            print("Swipe Left")
            noButtonAnimation()
        default:
            break
        }
    }
}
