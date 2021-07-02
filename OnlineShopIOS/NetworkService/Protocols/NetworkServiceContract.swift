//
//  NetworkServiceProtocols.swift
//  OnlineShopIOS
//
//  Created by Aleksandr Dorofeev on 21.06.2021.
//

import Foundation

// MARK: - Networkservice protocols
protocol NetworkServiceProtocol {
    func getProducts(completion: @escaping (Result<[Product]?, Error>) -> Void)
}
