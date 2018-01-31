//
//  AdvertismentsRouter.swift
//  Advertisments
//
//  Created by Mohamed Waly on 31.01.18.
//  Copyright © 2018 Mohamed Waly. All rights reserved.
//
//  Responsible for routing of flow of Advertisments Loading useCase 

import Foundation
import UIKit

final class AdvertismentsRouter {

    let interactor: AdvertismentsInteractorInput
    let presenter: AdvertismentsPresenterInput

    public init(interactor: AdvertismentsInteractorInput = AdvertismentsInteractor()) {
        self.presenter = AdvertismentsPresenter(with: interactor)
        self.interactor = interactor
    }

    func present(in navigationController: UINavigationController) {
        navigationController.pushViewController(controller(), animated: true)
    }

    public func controller() -> AdvertismentsViewController {
        let storyboard = UIStoryboard(name: String(describing: AdvertismentsPresenter.self), bundle: nil)
        let controller = storyboard.instantiateInitialViewController() as! AdvertismentsViewController
        return controller
    }

}
