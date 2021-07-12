//
//  ExtensionDelegate.swift
//  OnlineShopIOS
//
//  Created by Aleksandr Dorofeev on 15.06.2021.
//

import UIKit

// MARK: - Methods delegate
extension ProductViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = presenter?.products[indexPath.row]
        presenter?.tapOnItemProduct(product: product)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if !presenter!.fetchingMore && presenter!.hasNextPage  {
              return CGSize(width: collectionView.bounds.size.width, height: 50)
        } else {
            return CGSize.zero
        }
    }
}

extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let heightForCell: CGFloat = 100
        return heightForCell
    }
}
