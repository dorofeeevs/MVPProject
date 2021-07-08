//
//  DetailProductPresenter.swift
//  OnlineShopIOS
//
//  Created by Aleksandr Dorofeev on 23.06.2021.
//

import Foundation

class DetailProductPresenter: DetailViewPresenter {
    // MARK: - Private Properties
    private weak var view: DetailProductView?
    private let networkService: NetworkServiceProtocol!
    private var product: Product?
    private var router: Routable?

    // MARK: - Initialization
    required init(view: DetailProductView, networkService: NetworkServiceProtocol, router: Routable, product: Product?) {
        self.view = view
        self.networkService = networkService
        self.product = product
        self.router = router
    }
    // MARK: - Methods detail screen
    func loadProductInfo() {
        view?.showActivityIndicator(style: .medium, isUserInteractionEnabled: true)
        self.view?.showProduct(product: product)
        view?.hideActivityIndicator()
    }

    func backPreviousScreen() {
        view?.showActivityIndicator(style: .medium, isUserInteractionEnabled: true)
        router?.comeBack()
        view?.hideActivityIndicator()
    }
}
