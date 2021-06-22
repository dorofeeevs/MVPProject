//
//  Router.swift
//  OnlineShopIOS
//
//  Created by Aleksandr Dorofeev on 21.06.2021.
//

import UIKit

class Router: Routable {
    private var viewController: UIViewController?
    private var assemblyBuilder: MvpModuleCreatable?
    
    init(viewController: UIViewController, assemblyBuilder: MvpModuleCreatable) {
        self.viewController = viewController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func showDetail(product: Product?) {
    }
}
