//
//  ExtensionUIView.swift
//  OnlineShopIOS
//
//  Created by Aleksandr Dorofeev on 25.06.2021.
//

import UIKit

// MARK: - Abstract view protocols
protocol ReusableView: AnyObject {
    // MARK: - Public property
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    // MARK: - Public property
    static var defaultReuseIdentifier: String {
        return NSStringFromClass(self)
    }
}

protocol NibLoadableView: AnyObject {
    // MARK: - Public property
    static var nibName: String { get }
}

extension NibLoadableView where Self: UIView {
    // MARK: - Public property
    static var nibName: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
