//
//  ProductColleectionViewCellCollectionViewCell.swift
//  OnlineShopIOS
//
//  Created by Aleksandr Dorofeev on 6/4/21.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    static let identifier = "ProductCollectionViewCell"

    lazy var roundedBackgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.systemGray.cgColor
        view.layer.borderWidth = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var productTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 15)
        label.font = UIFont.systemFont(ofSize: 9, weight: .black)
        label.textColor = .black
        label.textAlignment = .center
        label.layer.cornerRadius = 10
        label.baselineAdjustment = .none
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var productCostLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 10)
        label.font = UIFont.systemFont(ofSize: 10, weight: .black)
        label.textAlignment = .center
        label.textColor = .black
        label.layer.cornerRadius = 10
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var productRaitingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 10)
        label.font = UIFont.systemFont(ofSize: 8, weight: .black)
        label.textAlignment = .center
        label.textColor = .black
        label.backgroundColor = .clear
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 12
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var productDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 15)
        label.font = UIFont.systemFont(ofSize: 8, weight: .black)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.layer.cornerRadius = 10
        label.baselineAdjustment = .none
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        setupUI()
    }
}

extension ProductCollectionViewCell {
    private func setupUI() {
        self.contentView.addSubview(roundedBackgroundView)
        roundedBackgroundView.addSubview(productTitleLabel)
        roundedBackgroundView.addSubview(productCostLabel)
        productImageView.addSubview(productRaitingLabel)
        roundedBackgroundView.addSubview(productImageView)
        roundedBackgroundView.addSubview(productDescriptionLabel)

        createRoundedBackgroundViewConstrait()
        createProductTitleLabelConstrait()
        createProductCostLabelConstrait()
        createProductImageViewConstrait()
        createProductRaitingLabelConstrait()
        createProductDescriptionLabelConstrait()
    }

    private func createRoundedBackgroundViewConstrait() {
        NSLayoutConstraint.activate([
            roundedBackgroundView.topAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.topAnchor, constant: 5),
            roundedBackgroundView.bottomAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            roundedBackgroundView.leftAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.leftAnchor, constant: 5),
            roundedBackgroundView.rightAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.rightAnchor, constant: -5)
        ])
    }

    private func createProductTitleLabelConstrait() {
        NSLayoutConstraint.activate([
            productTitleLabel.topAnchor.constraint(equalTo: roundedBackgroundView.centerYAnchor),
            productTitleLabel.bottomAnchor.constraint(equalTo: productCostLabel.topAnchor, constant: -25),
            productTitleLabel.leftAnchor.constraint(equalTo: roundedBackgroundView.leftAnchor, constant: 5),
            productTitleLabel.rightAnchor.constraint(equalTo: roundedBackgroundView.rightAnchor, constant: -5)

        ])
    }

    private func createProductCostLabelConstrait() {
        NSLayoutConstraint.activate([
            productCostLabel.bottomAnchor.constraint(equalTo: roundedBackgroundView.bottomAnchor),
            productCostLabel.topAnchor.constraint(equalTo: roundedBackgroundView.centerYAnchor, constant: 50),
            productCostLabel.leftAnchor.constraint(equalTo: roundedBackgroundView.leftAnchor, constant: 5),
            productCostLabel.rightAnchor.constraint(equalTo: roundedBackgroundView.rightAnchor, constant: -5)
        ])
    }

    private func createProductRaitingLabelConstrait() {
        NSLayoutConstraint.activate([
            productRaitingLabel.topAnchor.constraint(equalTo: roundedBackgroundView.topAnchor),
            productRaitingLabel.bottomAnchor.constraint(equalTo: productTitleLabel.topAnchor, constant: -50),
            productRaitingLabel.rightAnchor.constraint(equalTo: roundedBackgroundView.rightAnchor),
            productRaitingLabel.leftAnchor.constraint(equalTo: roundedBackgroundView.leftAnchor, constant: 130)
        ])
    }

    private func createProductImageViewConstrait() {
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: roundedBackgroundView.topAnchor),
            productImageView.bottomAnchor.constraint(equalTo: productTitleLabel.topAnchor),
            productImageView.leftAnchor.constraint(equalTo: roundedBackgroundView.leftAnchor),
            productImageView.rightAnchor.constraint(equalTo: roundedBackgroundView.rightAnchor)
        ])
    }

    private func createProductDescriptionLabelConstrait() {
        NSLayoutConstraint.activate([
            productDescriptionLabel.topAnchor.constraint(equalTo: productTitleLabel.bottomAnchor),
            productDescriptionLabel.bottomAnchor.constraint(equalTo: productCostLabel.topAnchor),
            productDescriptionLabel.leftAnchor.constraint(equalTo: roundedBackgroundView.leftAnchor, constant: 5),
            productDescriptionLabel.rightAnchor.constraint(equalTo: roundedBackgroundView.rightAnchor, constant: -5)
        ])
    }
}
