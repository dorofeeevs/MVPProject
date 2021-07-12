//
//  ProductPresenterProtocols.swift
//  OnlineShopIOS
//
//  Created by Aleksandr Dorofeev on 21.06.2021.
//

import Foundation

// MARK: - Product screen protocols
protocol ProductList: AnyObject, ActivityIndicatorPresentable {
    func reloadProductListItems()
    func showError(error: Error)
}

protocol ProductViewPresenter: AnyObject {
    var products: [Product]? {get}
    var filtredProducts: [Product]? {get}
    init(view: ProductList, networkService: NetworkServiceProtocol, router: Routable)
    func loadProducts()
    func filterContentForSearch(_ searchText: String)
    func tapOnItemProduct(product: Product?)
    func loadMoreProducts()
}
