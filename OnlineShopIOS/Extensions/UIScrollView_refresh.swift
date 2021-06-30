//
//  UIViewController_refresh.swift
//  OnlineShopIOS
//
//  Created by Aleksandr Dorofeev on 30.06.2021.
//

import UIKit

class RefreshControl: UIRefreshControl {
    // MARK: - Private properties
    private weak var actionTarget: AnyObject?
    private var actionSelector: Selector?
    
    // MARK: - Initializations
    override init() {
        super.init()
    }
    
    convenience init(actionTarget: AnyObject?, actionSelector: Selector) {
        self.init()
        self.actionTarget = actionTarget
        self.actionSelector = actionSelector
        addTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private method
    private func addTarget() {
        guard let actionTarget = actionTarget, let actionSelector = actionSelector else { return }
        addTarget(actionTarget, action: actionSelector, for: .valueChanged)
    }
    
    // MARK: - Public methods
    func endRefreshing(deadline: DispatchTime? = nil) {
        guard let deadline = deadline else { endRefreshing(); return }
        DispatchQueue.global(qos: .default).asyncAfter(deadline: deadline) { [weak self] in
            DispatchQueue.main.async {
                self?.endRefreshing()
            }
        }
    }
    
    func generateRefreshEvent() {
        beginRefreshing()
        sendActions(for: .valueChanged)
    }
}

public extension UIScrollView {
    // MARK: - Private properties
    private var _refreshControl: RefreshControl? {
        return (refreshControl as! RefreshControl)
    }

    private var canStartRefreshing: Bool {
        guard let refreshControl = refreshControl, !refreshControl.isRefreshing else { return false }
        return true
    }

    // MARK: - Public methods
    func addRefreshControll(actionTarget: AnyObject?, action: Selector, replaceIfExist: Bool = false) {
        if !replaceIfExist && refreshControl != nil { return }
        refreshControl = RefreshControl(actionTarget: actionTarget, actionSelector: action)
    }

    func startRefreshing() {
        guard canStartRefreshing else { return }
        _refreshControl?.generateRefreshEvent()
    }

    func endRefreshing(deadline: DispatchTime? = nil) {
        _refreshControl?.endRefreshing(deadline: deadline)
    }
}
