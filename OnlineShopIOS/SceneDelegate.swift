//
//  SceneDelegate.swift
//  OnlineShopIOS
//
//  Created by Akvelon on 6/1/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let productVc = ProductViewController()
            let cartVc = CartViewController()
            let historyVc = HistoryViewController()
            let productNavCont = setupTabBarItemNavigationController(rootViewController: productVc, title: "Product", imageName: "products", tag: 0)
            let cartNavCont = setupTabBarItemNavigationController(rootViewController: cartVc, title: "Cart", imageName: "cart", tag: 1)
            let historyNavCont = setupTabBarItemNavigationController(rootViewController: historyVc, title: "history", imageName: "history", tag: 2)
            let tabBarVc = UITabBarController()
            tabBarVc.setViewControllers([productNavCont, cartNavCont, historyNavCont], animated: true)
            window.rootViewController = tabBarVc
            window.backgroundColor = .white
            self.window = window
            self.window?.makeKeyAndVisible()
        }
    }
    private func setupTabBarItemNavigationController(rootViewController: UIViewController, title: String, imageName: String, tag: Int) -> UINavigationController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem = UITabBarItem(title: title, image: UIImage(named: imageName), tag: tag)
        return navController
    }


    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }

}
