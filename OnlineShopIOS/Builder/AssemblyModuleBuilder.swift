//
//  ModuleBuilder.swift
//  OnlineShopIOS
//
//  Created by Aleksandr Dorofeev on 15.06.2021.
//

import UIKit

class AssemblyModuleBuilder: MvpModuleCreatable {
    func createProductModule() -> UIViewController {
        let view = ProductViewController()
        let router = Router(viewController: view, assemblyBuilder: self)
        let networkService = NetworkService()
        let presenter = ProductListPresenter(view: view, networkService: networkService, router: router)
        view.presenter = presenter
        return view
    }

    func createDetailModule(product: Product?, router: Routable) -> UIViewController {
        guard let view = UIStoryboard(name: "Detail", bundle: nil).instantiateInitialViewController() as? DetailViewController else { return UIViewController() }
        let networkService = NetworkService()
        let presenter = DetailProductPresenter(view: view, networkService: networkService, router: router, product: product)
        view.presenter = presenter
        return view
    }
}
