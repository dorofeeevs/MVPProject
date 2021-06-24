//
//  ProductPresenter.swift
//  OnlineShopIOS
//
//  Created by Aleksandr Dorofeev on 6/7/21.
//

import Foundation

class ProductListPresenter: ProductViewPresenter {
<<<<<<< HEAD:OnlineShopIOS/Modules/ProductModule/Presenter/ProductListPresenter.swift
=======
    private var router: Routable?
>>>>>>> origin:OnlineShopIOS/Modules/ProductModule/Presenter/ProductPresenter.swift
    private(set) var products: [Product]?
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
}
