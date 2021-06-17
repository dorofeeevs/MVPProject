//
//  Product.swift
//  OnlineShopIOS
//
//  Created by Aleksandr Dorofeev on 6/4/21.
//

import Foundation

struct Product: Codable {
    let id: Int
    let title: String
    let description: String
    let cost: Double
    let rating: Double
    let imageName: String
    let categoryId: Int

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "name"
        case description = "description"
        case cost = "price"
        case rating = "rating"
        case imageName = "imagePath"
        case categoryId
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        description = try container.decode(String.self, forKey: .description)
        cost = try container.decode(Double.self, forKey: .cost)
        rating = try container.decode(Double.self, forKey: .rating)
        imageName = try container.decode(String.self, forKey: .imageName)
        categoryId = try container.decode(Int.self, forKey: .categoryId)
    }
    
    func getFormattedCost(_ cost: Double) -> String {
        return "\(cost) ₽"
    }
}

