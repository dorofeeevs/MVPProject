//
//  ProductPresenter.swift
//  OnlineShopIOS
//
//  Created by Aleksandr Dorofeev on 6/7/21.
//

import Foundation

class ProductListPresenter: ProductViewPresenter {
    private(set)var products: [Product] = []
    var page = 1
    var isInitialLoading = true
    var hasNextPage = true
    var fetchingMore = false
    
    // MARK: - Private properties
    private var router: Routable?
    private weak var view: ProductList?
    private let networkService: NetworkServiceProtocol?
  
    
    // MARK: - Initialization
    required init(view: ProductList, networkService: NetworkServiceProtocol, router: Routable ) {
        self.view = view
        self.networkService = networkService
        self.router = router
        loadProducts()
        loadMoreProducts()
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
    
    func loadMoreProducts() {
        guard !self.fetchingMore && self.hasNextPage else {return}
        self.page = page + 1
        DispatchQueue.main.async {
            self.loadProducts()
        }
    }
}
