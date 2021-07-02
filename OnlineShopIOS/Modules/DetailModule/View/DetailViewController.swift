//
//  ViewController.swift
//  OnlineShopIOS
//
//  Created by Aleksandr Dorofeev on 21.06.2021.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet private weak var detailProductTableView: UITableView!
    @IBOutlet private weak var detailProductImageView: UIImageView!
    @IBOutlet private weak var detailProductNameLabel: UILabel!
    @IBOutlet private weak var detailProductDescriptionLabel: UILabel!
    @IBOutlet private weak var detailProductCostLabel: UILabel!

    private var presenter: DetailViewPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.loadProductInfo()
    }
}

extension DetailViewController: DetailProductView {
    func showProduct(product: Product?) {
        detailProductNameLabel.text = product?.title
        detailProductDescriptionLabel.text = product?.description
        detailProductCostLabel.text = String(describing: product?.cost)
        detailProductImageView.image = UIImage(named: product?.imageName ?? "")
    }
}
