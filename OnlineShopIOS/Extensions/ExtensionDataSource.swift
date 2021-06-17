//
//  ExtensionDelegate.swift
//  OnlineShopIOS
//
//  Created by Aleksandr Dorofeev on 6/8/21.
//

import Foundation
import UIKit

extension ProductViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.products?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let productItem = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as? ProductCollectionViewCell {
            guard let product = presenter?.products?[indexPath.row] else {return UICollectionViewCell.init()}
            productItem.productTitleLabel.text = product.title
            productItem.productCostLabel.text = product.getFormattedCost(product.cost)
            productItem.productRaitingLabel.text = "\(product.rating)"
            productItem.productImageView.image = UIImage(named: product.imageName )
            productItem.productDescriptionLabel.text = product.description
        return productItem
        }
        return UICollectionViewCell()
    }
}
