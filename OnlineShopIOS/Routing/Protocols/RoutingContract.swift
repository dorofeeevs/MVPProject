//
//  RoutingProtocols.swift
//  OnlineShopIOS
//
//  Created by Aleksandr Dorofeev on 21.06.2021.
//

import UIKit

protocol GeneralRouterCreatable {
    var viewController: UIViewController? {get}
    var assemblyBuilder: MvpModuleCreatable? {get}
}

protocol Routable: GeneralRouterCreatable {
    func showDetail(product: Product?)
}
