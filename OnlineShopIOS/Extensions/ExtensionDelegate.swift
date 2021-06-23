//
//  ExtensionDelegate.swift
//  OnlineShopIOS
//
//  Created by Aleksandr Dorofeev on 15.06.2021.
//

import UIKit

extension ProductViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = presenter?.products?[indexPath.row]
        presenter?.tapOnItemProduct(product: product)
    }
}
