//
//  Protocols.swift
//  OnlineShopIOS
//
//  Created by Aleksandr Dorofeev on 16.06.2021.
//

import Foundation

protocol ProductView: AnyObject {
    func successfulRequest()
    func failureRequest(error: Error)
}

protocol ProductViewPresenter: AnyObject {
    var products: [Product]? {get}
    init(view: ProductView, networkService: NetworkServiceProtocol)
    func getProducts()
}
