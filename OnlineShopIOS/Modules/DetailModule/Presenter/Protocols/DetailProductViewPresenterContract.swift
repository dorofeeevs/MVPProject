//
//  DetailProductViewContract.swift
//  OnlineShopIOS
//
//  Created by Aleksandr Dorofeev on 23.06.2021.
//

import Foundation

// MARK: - Detail screen protocols
protocol DetailProductView: AnyObject, ActivityIndicatorPresentable {
    // MARK: - Public method
    func showProduct(product: Product?)
}

protocol DetailViewPresenter: AnyObject {
    init(view: DetailProductView, networkService: NetworkServiceProtocol, router: Routable, product: Product?)
    // MARK: - Public methods 
    func loadProductInfo()
    func backPreviousScreen()
}
