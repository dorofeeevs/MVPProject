//
//  TabBarViewController.swift
//  OnlineShopIOS
//
//  Created by Aleksandr Dorofeev on 6/3/21.
//

import UIKit

class TabBarViewController: UITabBarController {
    let assemblyBuilder = AssemblyModuleBuilder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        setupVc()
    }

    func setupVc() {
        viewControllers = [createNavController(for: assemblyBuilder.createProductModule(), title: NSLocalizedString("Products", comment: ""), imageName: "products"),
        createNavController(for: CartViewController(), title: NSLocalizedString("Cart", comment: ""), imageName: "cart"),
        createNavController(for: HistoryViewController(), title: NSLocalizedString("History", comment: ""), imageName: "history")]
    }

    fileprivate func createNavController(for rootViewController: UIViewController, title: String, imageName: String) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        navController.navigationBar.shadowImage = UIImage()
        navController.navigationBar.isTranslucent = true
        navController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navController.navigationBar.backgroundColor = .clear
        rootViewController.navigationItem.title = title
        return navController
    }
}
