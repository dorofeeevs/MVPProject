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
  
    // MARK: - Initialization
    required init(view: ProductList, networkService: NetworkServiceProtocol, router: Routable ) {
        self.view = view
        self.networkService = networkService
        self.router = router
        loadProducts()
    }
    
    // MARK: - Methods product list screen
    func tapOnItemProduct(product: Product?) {
        router?.showDetail(product: product)
    }
    
    func loadProducts() {
        if isInitialLoading {
            self.view?.showActivityIndicator(style: .large, isUserInteractionEnabled: true)
        }
        fetchingMore = true
        networkService?.getProducts(page: page) { [weak self] result in
            guard let self = self else {return}
            DispatchQueue.main.async { [self] in
                switch result {
                case .success(let products):
                    self.isInitialLoading = false
                    guard !products!.isEmpty else {
                        self.hasNextPage = false
                        self.fetchingMore = false
                        self.view?.reloadProductListItems()
                        return
                    }
                    self.products.append(contentsOf: products!)
                    self.view?.reloadProductListItems()
                case .failure(let error):
                    self.view?.showError(error: error)
                }
                self.fetchingMore = false
                self.view?.hideActivityIndicator()
            }
        }
    }
    
    func filterContentForSearch(_ searchText: String) {
        filtredProducts = products?.filter({ (products: Product) -> Bool in
            return products.title.lowercased().contains(searchText.lowercased())
        })
    }
}
