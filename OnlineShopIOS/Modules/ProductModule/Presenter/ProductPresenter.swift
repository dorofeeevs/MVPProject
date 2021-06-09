//
//  ProductPresenter.swift
//  OnlineShopIOS
//
//  Created by Aleksandr Dorofeev on 6/7/21.
//

import Foundation

protocol ProductViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

protocol ProductViewPresenterProtocol: AnyObject {
    init(view: ProductViewProtocol, networkService: NetworkServiceProtocol)
    func getProducts()
    var products: [Product]? {get set}
}

class ProductPresenter: ProductViewPresenterProtocol {
    var products: [Product]?
    weak var view: ProductViewProtocol?
    let networkService: NetworkServiceProtocol?

    required init(view: ProductViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getProducts()
    }

    func getProducts() {
        networkService?.getProducts { [weak self] result in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch result {
                case .success(let products):
                    self.products = products
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
}
