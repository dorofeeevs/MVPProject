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
    var products: [Product] {get}
    var fetchingMore: Bool {get set}
    var hasNextPage: Bool {get set}
    var isInitialLoading: Bool {get set}
    init(view: ProductList, networkService: NetworkServiceProtocol, router: Routable)
    func loadProducts()
    func tapOnItemProduct(product: Product?)
    func loadMoreProducts()
}
