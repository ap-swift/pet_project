//
//  ViewController.swift
//  languageCards
//
//  Created by Артем Парфенов on 10.01.2024.
//

import UIKit

class FirstPageViewController: UIViewController {

    private lazy var myView: FirstPageLayout? = FirstPageLayout(viewController: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "E4F4F2")

        myView?.addViews()
    }

    @objc func openGameViewController() {
        let nextViewController: UIViewController = TypeNameViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }

    @objc func openGameHistoryViewController() {
        let nextViewController: UIViewController = GameHistoryViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }

    @objc func openWebSite() {
        if let url = URL(string: "https://support.google.com/webmasters/answer/2445990?hl=en") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }

}


extension UIView {

    func addSubviews(views: [UIView]) {
        views.forEach { addSubview($0) }
    }
}


extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}


