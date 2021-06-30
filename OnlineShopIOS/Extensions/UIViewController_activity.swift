//
//  UIViewController_activity.swift
//  OnlineShopIOS
//
//  Created by Aleksandr Dorofeev on 30.06.2021.
//

import UIKit

protocol ActivityIndicatorPresentable {
    // MARK: - Public methods
    func startActivity(style: UIActivityIndicatorView.Style, isUserInteractionEnabled: Bool)
    func stopActivity()
}

extension ActivityIndicatorPresentable where Self: UIViewController {
    func startActivity(style: UIActivityIndicatorView.Style = .medium, isUserInteractionEnabled: Bool = false) {
        DispatchQueue.main.async {
            if let activityIndicator = self.findActivity() {
                activityIndicator.startAnimating()
            } else {
                let activityIndicator = UIActivityIndicatorView(style: style)
                activityIndicator.startAnimating()
                self.view.addSubview(activityIndicator)
                
                activityIndicator.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    activityIndicator.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
                    activityIndicator.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor)
                ])
                
            }
            self.view.isUserInteractionEnabled = isUserInteractionEnabled
        }
    }
    func stopActivity() {
        DispatchQueue.main.async {
            self.findActivity()?.stopAnimating()
            self.view.isUserInteractionEnabled = true
        }
    }
    
    // MARK: - Private method
    private func findActivity() -> UIActivityIndicatorView? {
        return view.subviews.compactMap { $0 as? UIActivityIndicatorView }.first
    }
}

