//
//  GameViewController.swift
//  LanguageCards
//
//  Created by Артем Парфенов on 24.01.2024.
//

import UIKit

class GameView {


    private weak var gameViewController: GameViewController?
    let myView: UIView

    init(view: UIView, gameViewController: GameViewController) {
        self.myView = view
        self.gameViewController = gameViewController
    }

    private var topView: UIView = {
        var view = UIView()
        view.backgroundColor = UIColor(red: 93/255, green: 166/255, blue: 207/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var topText: UILabel = {
        var label = UILabel()
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Тестовый текст"
        return label
    }()

    var cardView: UIView = {
        var cardView = UIView()
        cardView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        cardView.translatesAutoresizingMaskIntoConstraints = false
        return cardView
    }()

    var cardText: UILabel = {
        var cardText = UILabel()
        cardText.font = .systemFont(ofSize: 16, weight: .semibold)
        cardText.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        cardText.textAlignment = .center
        cardText.numberOfLines = 0
        cardText.translatesAutoresizingMaskIntoConstraints = false
        cardText.text = "Тестовый текст"
        return cardText
    }()

    lazy var buttonYes: UIButton = {
        var button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 93/255, green: 166/255, blue: 207/255, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("YES", for: .normal)
        button.clipsToBounds = true
        button.layer.masksToBounds = true
        button.addTarget(gameViewController, action: #selector(gameViewController?.yesButtonAnimation), for: .touchUpInside)
        return button
    }()

    lazy var buttonNo: UIButton = {
        var button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 93/255, green: 166/255, blue: 207/255, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("NO", for: .normal)
        button.layer.cornerRadius = 20.0
        button.clipsToBounds = true
        button.layer.masksToBounds = true
        button.addTarget(gameViewController, action: #selector(gameViewController?.noButtonAnimation), for: .touchUpInside)
        return button
    }()


    func addFrames() {

        myView.addSubviews(views: [topView, topText, cardView, cardText, buttonYes, buttonNo])

        topView.frame = CGRect(
            x: 24,
            y: 70,
            width: 325,
            height: 65
        )
        topView.layer.cornerRadius = 10

        topText.frame = CGRect(
            x: 24,
            y: 70,
            width: 325,
            height: 65
        )

        cardView.frame = CGRect(
            x: 70,
            y: 150,
            width: 235,
            height: 366
        )
        cardView.layer.cornerRadius = 10

        cardText.frame = CGRect(
            x: 70,
            y: 150,
            width: 235,
            height: 366
        )

        buttonYes.frame = CGRect(
            x: UIScreen.main.bounds.width - 150,
            y: 547,
            width: 90,
            height: 90
        )
        buttonYes.layer.cornerRadius = 45

        buttonNo.frame = CGRect(
            x: 60,
            y: 547,
            width: 90,
            height: 90
        )
        buttonNo.layer.cornerRadius = 45

    }

}
