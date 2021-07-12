//
//  ProductPresenter.swift
//  OnlineShopIOS
//
//  Created by Aleksandr Dorofeev on 6/7/21.
//

import Foundation
import UIKit

class ProductListPresenter: ProductViewPresenter {
    private(set) var filtredProducts: [Product]?
    private(set) var products: [Product]?
    private var router: Routable?
    private weak var view: ProductList?
    private let networkService: NetworkServiceProtocol?

    required init(view: ProductList, networkService: NetworkServiceProtocol, router: Routable ) {
        self.view = view
        self.networkService = networkService
        self.router = router
        loadProducts()
    }
    
    func tapOnItemProduct(product: Product?) {
        router?.showDetail(product: product)
    }

    func loadProducts() {
        networkService?.getProducts { [weak self] result in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch result {
                case .success(let products):
                    self.products = products
                    self.view?.reloadProductListItems()
                case .failure(let error):
                    self.view?.showError(error: error)
                }
            }
        }
    }
    
    func filterContentForSearch(_ searchText: String) {
        filtredProducts = products?.filter({ (products: Product) -> Bool in
            return products.title.lowercased().contains(searchText.lowercased())
        })
    }
}
