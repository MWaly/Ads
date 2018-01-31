//
//  AdvertismentsPresenter.swift
//  Advertisments
//
//  Created by Mohamed Waly on 31.01.18.
//  Copyright © 2018 Mohamed Waly. All rights reserved.
//

import Foundation

final class AdvertismentsPresenter: AdvertismentsPresenterInput {
    var ads: [Any] = []
    
    func loadNewAdvertisments() {
        
    }
    
    typealias T = Any
    

    var interactor: AdvertismentsInteractorInput

    init(with interactor: AdvertismentsInteractorInput) {
        self.interactor = interactor
    }
}
