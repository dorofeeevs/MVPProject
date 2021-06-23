//
//  DetailProductViewContract.swift
//  OnlineShopIOS
//
//  Created by Aleksandr Dorofeev on 23.06.2021.
//

import Foundation

protocol DetailProductView: AnyObject {
    func showProduct(product: Product?)
}

protocol DetailViewPresenter: AnyObject {
    init(view: DetailProductView, networkService: NetworkServiceProtocol, product: Product?)
    func loadProductInfo()
}
