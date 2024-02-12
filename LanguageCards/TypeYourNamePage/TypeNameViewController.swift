//
//  GameViewController.swift
//  LanguageCards
//
//  Created by Артем Парфенов on 18.01.2024.
//

import UIKit

class TypeNameViewController: UIViewController {

    private lazy var typeNameLayout: TypeNameLayout? = TypeNameLayout(viewController: self)
    private var timer: Timer?
    static var userName: String?

    private var sec = 3
    private var isButtonPressed: Bool = false
    private var textWasWritten: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        typeNameLayout?.addViews()

        addNavigationBarStyle()
    }

    func addNavigationBarStyle() {
        navigationController?.navigationBar.tintColor = UIColor.green
        self.title = "Enter name screen"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.green]
    }

    @objc func openGameViewScreen() {
        let nextViewController: UIViewController = GameViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }

    @objc func startTimer() {

        guard !isButtonPressed else {
            print("isButtonPressed state = ", isButtonPressed)
            return
        }

        guard textWasWritten else {
            print("textWasWritten state = ", textWasWritten)
            return
        }

        isButtonPressed = true
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(showTimerLabel), userInfo: nil, repeats: true)
    }

    @objc func showTimerLabel() {
        typeNameLayout?.timerLabel.text = "\(sec)"
        sec -= 1
        if sec < 0 {
            // Остановите таймер
            timer?.invalidate()
            openGameViewScreen()
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        typeNameLayout?.timerLabel.text = ""
        sec = 3
        isButtonPressed = false
        textWasWritten = false
        typeNameLayout!.typeNameTextFiled.text = ""
    }

}

extension TypeNameViewController: UITextFieldDelegate {

    @objc func textFieldDidChange(_ textField: UITextField) {
        if let text = textField.text {
            typeNameLayout?.welcomeLabel.text = "Welcome to the game"
            typeNameLayout?.nameLabel.text = text
            TypeNameViewController.userName = text
        }
        textWasWritten = true
        print("textWasWritten status =", textWasWritten)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard textField.text != "" else { return false }
        textField.resignFirstResponder()
        print("сработал textFieldShouldReturn")
        return true
    }

}
