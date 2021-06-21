//
//  ExtensionDelegate.swift
//  OnlineShopIOS
//
//  Created by Aleksandr Dorofeev on 6/8/21.
//

import Foundation
import UIKit

extension ProductViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.products?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let productItem = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as? ProductCollectionViewCell {
            let product = presenter?.products?[indexPath.row]
            productItem.productTitleLabel.text = product?.productTitle
            let cost = product != nil ? "\(product!.productCost)" : ""
            productItem.productCostLabel.text = "\(cost) ₽"
            let rating = product != nil ? "\(product!.productRaiting)" : ""
            productItem.productRaitingLabel.text = "\(rating)"
            productItem.productImageView.image = UIImage(named: product?.productImageName ?? "")
            productItem.productDescriptionLabel.text = product?.productDescription
        return productItem
        }
        return UICollectionViewCell()
    }
}
