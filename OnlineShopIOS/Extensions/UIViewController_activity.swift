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
        if let activityIndicator = findActivity() {
            activityIndicator.startAnimating()
        }
        self.view.isUserInteractionEnabled = isUserInteractionEnabled
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async { [self] in
            findActivity()?.stopAnimating()
            view.isUserInteractionEnabled = true
        }
    }
    
    func createActivity(style: UIActivityIndicatorView.Style ) {
        let activityIndicator = UIActivityIndicatorView(style: style)
        view.addSubview(activityIndicator)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
    }
    
    // MARK: - Private method
    private func findActivity() -> UIActivityIndicatorView? {
        return view.subviews.compactMap { $0 as? UIActivityIndicatorView }.first
    }
}
