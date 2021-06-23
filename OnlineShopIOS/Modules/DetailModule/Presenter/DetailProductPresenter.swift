//
//  DetailProductPresenter.swift
//  OnlineShopIOS
//
//  Created by Aleksandr Dorofeev on 23.06.2021.
//

import Foundation

protocol DetailProductView: AnyObject {
    func setProduct(product: Product?)
}

protocol DetailViewPresenter: AnyObject {
    init(view: DetailProductView, networkService: NetworkServiceProtocol, product: Product?)
    func showProduct()
}

class DetailProductPresenter: DetailViewPresenter {
    weak var view: DetailProductView?
    let networkService: NetworkServiceProtocol!
    var product: Product?
    required init(view: DetailProductView, networkService: NetworkServiceProtocol, product: Product?) {
        self.view = view
        self.networkService = networkService
        self.product = product
    }
    
    func showProduct() {
        self.view?.setProduct(product: product)
    }
    
}
