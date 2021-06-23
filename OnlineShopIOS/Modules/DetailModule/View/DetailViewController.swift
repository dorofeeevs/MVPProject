//
//  ViewController.swift
//  OnlineShopIOS
//
//  Created by Aleksandr Dorofeev on 21.06.2021.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var detailProductTableView: UITableView!
    @IBOutlet weak var detailProductImageView: UIImageView!
    @IBOutlet weak var detailProductNameLabel: UILabel!
    @IBOutlet weak var detailProductDescriptionLabel: UILabel!
    @IBOutlet weak var detailProductCostLabel: UILabel!
    
    var presenter: DetailViewPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.showProduct()
    }
    
    @IBAction func backButton(_ sender: Any) {
    }
}

extension DetailViewController: DetailProductView {
    func setProduct(product: Product?) {
        detailProductNameLabel.text = product?.title
        detailProductDescriptionLabel.text = product?.description
        detailProductCostLabel.text = String(describing: product?.cost)
        detailProductImageView.image = UIImage(named: product?.imageName ?? "")
    }
}
