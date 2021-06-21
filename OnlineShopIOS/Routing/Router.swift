//
//  Router.swift
//  OnlineShopIOS
//
//  Created by Aleksandr Dorofeev on 21.06.2021.
//

import UIKit

class Router: Routable {
    var viewController: UIViewController?
    var assemblyBuilder: MvpModuleCreatable?
    
    init(viewController: UIViewController, assemblyBuilder: MvpModuleCreatable) {
        self.viewController = viewController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func showDetail(product: Product?) {
    }
}
