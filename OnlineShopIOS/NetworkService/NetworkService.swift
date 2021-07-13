//
//  NetworkService.swift
//  OnlineShopIOS
//
//  Created by Aleksandr Dorofeev on 6/8/21.
//

import Foundation

class NetworkService: NetworkServiceProtocol {
    // MARK: - Properties
    private let baseUrlString = "http://localhost:5000/api"
    private let productPathUrlString = "/products"
    
    // MARK: - Network request
    func getProducts(page: Int,_ completion: @escaping (Result<[Product]?, Error>) -> Void) {
        var urlComponents = URLComponents(string: baseUrlString + productPathUrlString)
        urlComponents?.queryItems = [
            URLQueryItem(name: "page", value: "\(page)")
        ]
        guard let url = urlComponents?.url else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            do {
                let obj = try JSONDecoder().decode([Product].self, from: data!)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
