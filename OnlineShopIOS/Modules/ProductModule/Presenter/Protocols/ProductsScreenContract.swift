//
//  ProductPresenterProtocols.swift
//  OnlineShopIOS
//
//  Created by Aleksandr Dorofeev on 21.06.2021.
//

import Foundation

protocol ProductList: AnyObject, ActivityIndicatorPresentable {
    func reloadProductListItems()
    func showError(error: Error)
}

protocol ProductViewPresenter: AnyObject {
    var products: [Product]? {get}
    init(view: ProductList, networkService: NetworkServiceProtocol, router: Routable)
    func loadProducts()
    func tapOnItemProduct(product: Product?)
}
