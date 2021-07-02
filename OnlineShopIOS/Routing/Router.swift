//
//  Router.swift
//  OnlineShopIOS
//
//  Created by Aleksandr Dorofeev on 21.06.2021.
//

import UIKit

class Router: Routable {
    // MARK: - Private properties
    private var viewController: UIViewController?
    private var assemblyBuilder: MvpModuleCreatable?

    // MARK: - Initialization
    init(viewController: UIViewController, assemblyBuilder: MvpModuleCreatable) {
        self.viewController = viewController
        self.assemblyBuilder = assemblyBuilder
    }

    // MARK: - Routing methods
    func showDetail(product: Product?) {
        if let navigationController = viewController?.navigationController {
            guard let detailViewController = assemblyBuilder?.createDetailModule(product: product, router: self) else {return}
            navigationController.pushViewController(detailViewController, animated: true)
        }
    }

    func comeBack() {
        if let navigationController = viewController?.navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
}
