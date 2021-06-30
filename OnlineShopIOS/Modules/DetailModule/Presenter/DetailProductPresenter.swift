//
//  DetailProductPresenter.swift
//  OnlineShopIOS
//
//  Created by Aleksandr Dorofeev on 23.06.2021.
//

import Foundation

class DetailProductPresenter: DetailViewPresenter {
    private weak var view: DetailProductView?
    private let networkService: NetworkServiceProtocol!
    private var product: Product?
    
    required init(view: DetailProductView, networkService: NetworkServiceProtocol, product: Product?) {
        self.view = view
        self.networkService = networkService
        self.product = product
    }
    
    func loadProductInfo() {
        view?.startActivity(style: .medium, isUserInteractionEnabled: true)
        self.view?.showProduct(product: product)
        view?.stopActivity()
    }
}
