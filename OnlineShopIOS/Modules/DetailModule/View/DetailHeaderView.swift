//
//  DetailHeaderView.swift
//  OnlineShopIOS
//
//  Created by Aleksandr Dorofeev on 29.06.2021.
//

import UIKit

final class DetailHeaderView: UIView, ReusableView, NibLoadableView {
    // MARK: IBOutlets
    @IBOutlet private weak var detailProductNameLabel: UILabel!
    @IBOutlet private weak var detailProductDescriptionLabel: UILabel!
    @IBOutlet private weak var detailProductCostLabel: UILabel!
    @IBOutlet private weak var detailProductImageView: UIImageView!
    @IBOutlet private var detailProductRatingLabel: UILabel!

    // MARK: - Public method
    func configurate(with product: Product) {
        detailProductNameLabel.text = product.title
        detailProductDescriptionLabel.text = product.description
        detailProductCostLabel.text = product.getFormattedCost(product.cost)
        detailProductImageView.image = UIImage(named: product.imageName)
        detailProductRatingLabel.text = "\(product.rating)"
    }
}
