//
//  ViewController.swift
//  OnlineShopIOS
//
//  Created by Aleksandr Dorofeev on 21.06.2021.
//

import UIKit

class DetailViewController: UIViewController {
    // MARK: - IBoutlets
    @IBOutlet private weak var detailProductTableView: UITableView!
    @IBOutlet private weak var detailHeaderView: DetailHeaderView!

    var presenter: DetailViewPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        presenter?.loadProductInfo()
        addBehaviors(behaviors: [HideNavigationBarBehavior()])
    }

    // MARK: - Private methods
    private func setupViews() {
        setupTableView()
    }

    private func setupTableView() {
        detailProductTableView.alpha = 1
        detailProductTableView.contentInsetAdjustmentBehavior = .never
        detailProductTableView.tableHeaderView = detailHeaderView
        detailProductTableView.register(DetailCell.self)
    }

    // MARK: - IBAction for back button
    @IBAction private func backToProductList(_ sender: Any) {
        presenter.backPreviousScreen()
    }
}

extension DetailViewController: DetailProductView {
    // MARK: - Transfer data for header
    func showProduct(product: Product?) {
        detailHeaderView.configurate(with: product!)
    }
}
