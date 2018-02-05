//
//  AdvertismentsWireframe
//  Advertisments
//
//  Copyright © 2018 Mohamed Waly. All rights reserved.
//
//  Responsible for routing of flow of Advertisments Loading useCase 

import Foundation
import UIKit

final class AdvertismentsWireframe {

    let interactor: AdvertismentsInteractorInput
    var presenter: AdvertismentsPresenterInput

    lazy var controller: AdvertismentsViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "AdvertismentsViewController") as! AdvertismentsViewController
        viewController.presenter = presenter
        return viewController
    }()

    public init(interactor: AdvertismentsInteractorInput = AdvertismentsInteractor()) {
        self.interactor = interactor
        self.presenter = AdvertismentsPresenter(with: interactor)
    }

}
