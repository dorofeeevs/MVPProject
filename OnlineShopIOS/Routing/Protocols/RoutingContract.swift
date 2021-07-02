//
//  RoutingProtocols.swift
//  OnlineShopIOS
//
//  Created by Aleksandr Dorofeev on 21.06.2021.
//

import Foundation

// MARK: - Routing protocols
protocol Routable {
    // MARK: - Public methods
    func showDetail(product: Product?)
    func comeBack()
}
