//
//  ViewController.swift
//  OnlineShopIOS
//
//  Created by Akvelon on 6/1/21.
//

import UIKit

class ProductViewController: UIViewController {
    let countCellForStartingPagination = 2
    var presenter: ProductViewPresenter?
    var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    var loadingView: ProductCollectionFooterReusableView?
    
    // MARK: - Lazy property
    lazy var productCollectionView: UICollectionView = {
        let loadingReusableNib = UINib(nibName: "ProductCollectionReusableView", bundle: nil)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        collectionView.backgroundColor = .white
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        collectionView.register(loadingReusableNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "loadingReusableViewId")
        collectionView.contentInsetAdjustmentBehavior = .always
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.addRefreshControll(actionTarget: self, action: #selector(refreshData))
        return collectionView
    }()
    
    private var searchController = UISearchController(searchResultsController: nil)
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    private var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        createSearchController()
    }
}

extension ProductViewController {
    // MARK: - Private methods
    private func setupUI() {
        overrideUserInterfaceStyle = .light
        self.view.backgroundColor = .white
        self.view.addSubview(productCollectionView)
        createActivity(style: .medium)
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
    // MARK: - Methods product list screen
    func reloadProductListItems() {
        productCollectionView.reloadData()
    }

    func showError(error: Error) {
        print(error.localizedDescription)
    }

    // MARK: - obgc Method
    @objc func refreshData(_ refreshControl: UIRefreshControl) {
        //addBehaviors(behaviors: [HideNavigationBarBehavior()])
        productCollectionView.startRefreshing()
        productCollectionView.reloadData()
        productCollectionView.endRefreshing(deadline: .now() + .seconds(1))
    }
}

extension ProductViewController: UISearchResultsUpdating {
    func createSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search..."
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = false
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { [weak self] timer in
            guard let self = self else { return }
            self.presenter?.filterContentForSearch(self.searchController.searchBar.text ?? "")
            self.productCollectionView.reloadData()
            timer.invalidate()
        })
    }
}
