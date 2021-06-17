//
//  Protocols.swift
//  OnlineShopIOS
//
//  Created by Aleksandr Dorofeev on 16.06.2021.
//

import Foundation

protocol ProductListView: AnyObject {
    func reloadProductListItems()
    func showError(error: Error)
}

protocol ProductViewPresenter: AnyObject {
    var products: [Product]? {get}
    init(view: ProductListView, networkService: NetworkServiceProtocol)
    func getProducts()
}
