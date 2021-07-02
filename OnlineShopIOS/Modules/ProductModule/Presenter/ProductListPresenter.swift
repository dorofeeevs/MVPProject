//
//  ProductPresenter.swift
//  OnlineShopIOS
//
//  Created by Aleksandr Dorofeev on 6/7/21.
//

import Foundation

class ProductListPresenter: ProductViewPresenter {
    private(set) var products: [Product]?

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
    }
    // MARK: - Methods product list screen
    func tapOnItemProduct(product: Product?) {
        router?.showDetail(product: product)
    }

    func loadProducts() {
        self.view?.showActivityIndicator(style: .large, isUserInteractionEnabled: true)
        networkService?.getProducts { [weak self] result in
            guard let self = self else {return}
            self.view?.hideActivityIndicator()
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
}
