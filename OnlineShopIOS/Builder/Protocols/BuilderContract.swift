//
//  BuilderProtocols.swift
//  OnlineShopIOS
//
//  Created by Aleksandr Dorofeev on 21.06.2021.
//

import UIKit

// MARK: - Builder protocols
protocol MvpModuleCreatable {
    // MARK: - Public methods
    func createProductModule() -> UIViewController
    func createDetailModule(product: Product?, router: Routable) -> UIViewController
}
