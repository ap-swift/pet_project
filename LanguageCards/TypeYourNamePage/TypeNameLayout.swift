//
//  TypeNameView.swift
//  LanguageCards
//
//  Created by Артем Парфенов on 20.01.2024.
//

import UIKit

class TypeNameLayout {

    private weak var viewController: TypeNameViewController?
    
    private(set) var typeNameTextFiled: UITextField = UITextField()

     init(viewController: TypeNameViewController) {
         self.viewController = viewController
         setupTextField()
     }

    // MARK: Views

    private var typeNameLabel: UILabel = {
        var label = UILabel()
        label.text = "Please type your name"
        label.textColor = UIColor(hex: "FFFFFF")
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private func setupTextField() {
        typeNameTextFiled.placeholder = "Type your name and Enter"
        typeNameTextFiled.textColor = .black
        typeNameTextFiled.backgroundColor = .white
        typeNameTextFiled.textAlignment = .left
        typeNameTextFiled.font = .systemFont(ofSize: 20, weight: .semibold)
        typeNameTextFiled.borderStyle = .bezel
        typeNameTextFiled.layer.borderWidth = 2
        typeNameTextFiled.translatesAutoresizingMaskIntoConstraints = false
        typeNameTextFiled.delegate = viewController
        typeNameTextFiled.addTarget(viewController, action: #selector(viewController!.textFieldDidChange(_:)), for: .editingDidEnd)
    }

    private lazy var circleButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(hex: "D1FE1D")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 50
        button.layer.masksToBounds = true

        var label = UILabel()
        label.text = "GO"
        label.textColor = UIColor(hex: "007D23")
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0

        button.addSubview(label)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: button.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: button.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 100)
        ])

        button.addTarget(viewController, action: #selector(viewController!.startTimer), for: .touchUpInside)

        return button
    }()

    private(set) var welcomeLabel: UILabel = {
        var welcomeLabel = UILabel()
        welcomeLabel.textColor = UIColor(hex: "FFFFFF")
        welcomeLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.numberOfLines = 1
        welcomeLabel.textAlignment = .center
        return welcomeLabel
    }()

    private(set) var nameLabel: UILabel = {
        var welcomeLabel = UILabel()
        welcomeLabel.textColor = UIColor(hex: "FFFFFF")
        welcomeLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.numberOfLines = 1
        welcomeLabel.textAlignment = .center
        return welcomeLabel
    }()

    private(set) var timerLabel: UILabel = {
        var timerLabel = UILabel()
        timerLabel.textColor = .white
        timerLabel.font = .systemFont(ofSize: 40, weight: .bold)
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        timerLabel.sizeToFit()
        timerLabel.backgroundColor = UIColor.clear
        return timerLabel
    }()

    // MARK: Constraints

    func addViews() {

        viewController!.view.backgroundColor = UIColor(hex: "5DA6CF")

        viewController?.view.addSubviews(views: [typeNameLabel, typeNameTextFiled, circleButton, welcomeLabel, nameLabel, timerLabel])

        let constraints = [
            typeNameLabel.centerXAnchor.constraint(equalTo: viewController!.view.centerXAnchor),
            typeNameLabel.topAnchor.constraint(equalTo: viewController!.view.safeAreaLayoutGuide.topAnchor, constant: 18),
            typeNameTextFiled.centerXAnchor.constraint(equalTo: viewController!.view.centerXAnchor),
            typeNameTextFiled.topAnchor.constraint(equalTo: typeNameLabel.bottomAnchor, constant: 22),
            typeNameTextFiled.widthAnchor.constraint(equalToConstant: 280),
            welcomeLabel.centerXAnchor.constraint(equalTo: viewController!.view.centerXAnchor),
            welcomeLabel.topAnchor.constraint(equalTo: typeNameTextFiled.bottomAnchor, constant: 30),
            nameLabel.centerXAnchor.constraint(equalTo: viewController!.view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 10),
            circleButton.centerXAnchor.constraint(equalTo: viewController!.view.centerXAnchor),
            circleButton.topAnchor.constraint(equalTo: typeNameTextFiled.bottomAnchor, constant: 100),
            timerLabel.centerXAnchor.constraint(equalTo: viewController!.view.centerXAnchor),
            timerLabel.topAnchor.constraint(equalTo: circleButton.bottomAnchor, constant: 20)
        ]
        NSLayoutConstraint.activate(constraints)
    }

}

