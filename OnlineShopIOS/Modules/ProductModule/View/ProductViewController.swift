//
//  ViewController.swift
//  OnlineShopIOS
//
//  Created by Akvelon on 6/1/21.
//

import UIKit

class ProductViewController: UIViewController {
    var presenter: ProductViewPresenter?
    lazy var productCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        collectionView.backgroundColor = .white
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        collectionView.contentInsetAdjustmentBehavior = .always
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.addRefreshControll(actionTarget: self, action: #selector(refreshData))
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension ProductViewController {
    private func setupUI() {
        overrideUserInterfaceStyle = .light
        self.view.backgroundColor = .white
        self.view.addSubview(productCollectionView)
        setupConstraits()
    }

    private func setupConstraits() {
        NSLayoutConstraint.activate([
            productCollectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            productCollectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            productCollectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            productCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }

    private func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let cellWidthHeightConstant: CGFloat = UIScreen.main.bounds.width/2.2
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        layout.itemSize = CGSize(width: cellWidthHeightConstant, height: cellWidthHeightConstant)
        return layout
    }
}

extension ProductViewController: ProductList {
    func reloadProductListItems() {
        productCollectionView.reloadData()
    }

    func showError(error: Error) {
        print(error.localizedDescription)
    }

    // MARK: - obgc Method

    @objc func refreshData(_ refreshControl: UIRefreshControl) {
        productCollectionView.startRefreshing()
        productCollectionView.reloadData()
        productCollectionView.endRefreshing(deadline: .now() + .seconds(2))
    }
}
