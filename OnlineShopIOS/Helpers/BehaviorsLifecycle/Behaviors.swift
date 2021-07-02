//
//  Behaviors.swift
//  OnlineShopIOS
//
//  Created by Aleksandr Dorofeev on 28.06.2021.
//

import UIKit

struct HideNavigationBarBehavior: ViewControllerLifecycleBehavior {
    // MARK: - Methods for hide nav bar
    func beforeAppearing(viewController: UIViewController) {
        viewController.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    func beforeDisappearing(viewController: UIViewController) {
        viewController.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
