//
//  ViewModel.swift
//  LanguageCards
//
//  Created by Артем Парфенов on 11.01.2024.
//

import UIKit


class FirstPageLayout {

    private weak var firstPageViewController: FirstPageViewController?

    init(viewController: FirstPageViewController) {
        self.firstPageViewController = viewController
    }

    private var titleLabel: UILabel = {
        var title = UILabel()
        title.text = "Yes or No"
        title.textColor = UIColor(hex: "5DA6CF")
        title.font = UIFont.systemFont(ofSize: 60, weight: .semibold)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .center
        title.numberOfLines = 0
        return title
    }()

    private var currentGameLabel: UILabel = {
        var title = UILabel()
        title.text = "Your current game score:"
        title.textColor = UIColor(hex: "5DA6CF")
        title.backgroundColor = .white
        title.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .center
        title.numberOfLines = 0
        return title
    }()

    private var displayScoreLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var scoreBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()


    private lazy var gameHistoryButton: UIButton = {
        var button = UIButton(type: .system)
        button.backgroundColor = UIColor(hex: "5DA6CF")
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(firstPageViewController, action: #selector(firstPageViewController!.openGameHistoryViewController), for: .touchUpInside)
        button.setTitle("Game history", for: .normal)
        button.layer.cornerRadius = 20.0
        button.clipsToBounds = true
        button.layer.masksToBounds = true
        return button
    }()

    private lazy var playButton: UIButton = {
        var button = UIButton(type: .system)
        button.backgroundColor = UIColor(red: CGFloat(93) / 255.0, green: CGFloat(166) / 255.0, blue: CGFloat(207) / 255.0, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Play", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(firstPageViewController, action: #selector(firstPageViewController!.openGameViewController), for: .touchUpInside)
        button.layer.cornerRadius = 20.0
        button.clipsToBounds = true
        button.layer.masksToBounds = true
        return button
    }()

    private lazy var continueButton: UIButton = {
        var button = UIButton(type: .system)
        button.backgroundColor = UIColor(hex: "5DA6CF")
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Continue", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(firstPageViewController, action: #selector(firstPageViewController!.openWebSite), for: .touchUpInside)
        button.layer.cornerRadius = 20.0
        button.clipsToBounds = true
        button.layer.masksToBounds = true
        return button
    }()


    func addViews() {

        firstPageViewController!.view.addSubviews(views: [titleLabel, scoreBackgroundView, currentGameLabel, displayScoreLabel, gameHistoryButton, playButton, continueButton])

        let constraints = [
            titleLabel.centerXAnchor.constraint(equalTo: firstPageViewController!.view.safeAreaLayoutGuide.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: firstPageViewController!.view.safeAreaLayoutGuide.topAnchor, constant: 80),

            scoreBackgroundView.centerXAnchor.constraint(equalTo: firstPageViewController!.view.safeAreaLayoutGuide.centerXAnchor),
            scoreBackgroundView.bottomAnchor.constraint(equalTo: gameHistoryButton.topAnchor, constant: -32),
            scoreBackgroundView.widthAnchor.constraint(equalTo: firstPageViewController!.view.widthAnchor, multiplier: 0.8),
            scoreBackgroundView.heightAnchor.constraint(equalToConstant: 80),

            currentGameLabel.centerXAnchor.constraint(equalTo: firstPageViewController!.view.safeAreaLayoutGuide.centerXAnchor),
            currentGameLabel.topAnchor.constraint(equalTo: scoreBackgroundView.topAnchor, constant: 13),
            currentGameLabel.heightAnchor.constraint(equalToConstant: 20),

            displayScoreLabel.centerXAnchor.constraint(equalTo: firstPageViewController!.view.safeAreaLayoutGuide.centerXAnchor),
            displayScoreLabel.bottomAnchor.constraint(equalTo: scoreBackgroundView.bottomAnchor, constant: -13),

            gameHistoryButton.centerXAnchor.constraint(equalTo: firstPageViewController!.view.safeAreaLayoutGuide.centerXAnchor),
            gameHistoryButton.bottomAnchor.constraint(equalTo: playButton.topAnchor, constant: -20),
            gameHistoryButton.widthAnchor.constraint(equalTo: firstPageViewController!.view.widthAnchor, multiplier: 0.8),
            gameHistoryButton.heightAnchor.constraint(equalToConstant: 50),

            playButton.centerXAnchor.constraint(equalTo: firstPageViewController!.view.safeAreaLayoutGuide.centerXAnchor),
            playButton.bottomAnchor.constraint(equalTo: continueButton.topAnchor, constant: -20),
            playButton.widthAnchor.constraint(equalTo: firstPageViewController!.view.widthAnchor, multiplier: 0.8),
            playButton.heightAnchor.constraint(equalToConstant: 50),

            continueButton.centerXAnchor.constraint(equalTo: firstPageViewController!.view.safeAreaLayoutGuide.centerXAnchor),
            continueButton.widthAnchor.constraint(equalTo: firstPageViewController!.view.widthAnchor, multiplier: 0.8),
            continueButton.heightAnchor.constraint(equalToConstant: 50),
            continueButton.bottomAnchor.constraint(equalTo: firstPageViewController!.view.safeAreaLayoutGuide.bottomAnchor, constant: -111)
        ]

        NSLayoutConstraint.activate(constraints)
    }

}
