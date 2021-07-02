//
//  Product.swift
//  OnlineShopIOS
//
//  Created by Aleksandr Dorofeev on 6/4/21.
//

import Foundation

struct Product: Codable {
    let identifier: Int
    let title: String
    let description: String
    let cost: Double
    let rating: Double
    let imageName: String
    let categoryId: Int

    // MARK: - Coding keys
    private enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case title = "name"
        case description = "description"
        case cost = "price"
        case rating = "rating"
        case imageName = "imagePath"
        case categoryId
    }

    // MARK: - Initialization
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        identifier = try container.decode(Int.self, forKey: .identifier)
        title = try container.decode(String.self, forKey: .title)
        description = try container.decode(String.self, forKey: .description)
        cost = try container.decode(Double.self, forKey: .cost)
        rating = try container.decode(Double.self, forKey: .rating)
        imageName = try container.decode(String.self, forKey: .imageName)
        categoryId = try container.decode(Int.self, forKey: .categoryId)
    }

    // MARK: - Public method
    func getFormattedCost(_ price: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.groupingSeparator = " "
        numberFormatter.groupingSize = 3
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.decimalSeparator = " "
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 6
        return numberFormatter.string(from: price as NSNumber)! + " " + "₽"
    }
}
