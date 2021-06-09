//
//  Product.swift
//  OnlineShopIOS
//
//  Created by Aleksandr Dorofeev on 6/4/21.
//

import Foundation

struct Product: Codable {
    let productId: Int32
    let productTitle: String
    let productDescription: String
    let productCost: Double
    let productRaiting: Double
    let productImageName: String
    let categoryId: Int32

    private enum CodingKeys: String, CodingKey {
        case productId = "id", productTitle = "name", productDescription = "description", productCost = "price", productRaiting = "rating", productImageName = "imagePath", categoryId
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        productId = try container.decode(Int32.self, forKey: .productId)
        productTitle = try container.decode(String.self, forKey: .productTitle)
        productDescription = try container.decode(String.self, forKey: .productDescription)
        productCost = try container.decode(Double.self, forKey: .productCost)
        productRaiting = try container.decode(Double.self, forKey: .productRaiting)
        productImageName = try container.decode(String.self, forKey: .productImageName)
        categoryId = try container.decode(Int32.self, forKey: .categoryId)
    }
}
