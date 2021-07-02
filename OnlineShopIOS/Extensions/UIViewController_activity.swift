//
//  UIViewController_activity.swift
//  OnlineShopIOS
//
//  Created by Aleksandr Dorofeev on 30.06.2021.
//

import UIKit

protocol ActivityIndicatorPresentable {
    // MARK: - Public methods
    func showActivityIndicator(style: UIActivityIndicatorView.Style, isUserInteractionEnabled: Bool)
    func hideActivityIndicator()
}

extension ActivityIndicatorPresentable where Self: UIViewController {
    func showActivityIndicator(style: UIActivityIndicatorView.Style = .medium, isUserInteractionEnabled: Bool = false) {
        DispatchQueue.main.async { [self] in
            if let activityIndicator = findActivity() {
                activityIndicator.startAnimating()
            } else {
                createActivity(style: style)
            }
            self.view.isUserInteractionEnabled = isUserInteractionEnabled
        }
    }
    func hideActivityIndicator() {
        DispatchQueue.main.async { [self] in
            findActivity()?.stopAnimating()
            view.isUserInteractionEnabled = true
        }
    }

    // MARK: - Private method
    private func findActivity() -> UIActivityIndicatorView? {
        return view.subviews.compactMap { $0 as? UIActivityIndicatorView }.first
    }

    private func createActivity(style: UIActivityIndicatorView.Style ) {
        let activityIndicator = UIActivityIndicatorView(style: style)
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)

        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
    }
}
