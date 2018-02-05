//
//  AdvertismentsPresenter.swift
//  Advertisments
//
//  Copyright © 2018 Mohamed Waly. All rights reserved.
//
//  Responsible for updating visual data of ads after having the business logic applied


import Foundation

final class AdvertismentsPresenter: AdvertismentsPresenterInput {

    var numberOfAds: Int = 0
    var ads: [Advertisment] = []
    weak var output: AdvertismentsPresenterOutput?
    private var interactor: AdvertismentsInteractorInput 
    
    init(with interactor: AdvertismentsInteractorInput) {
        self.interactor = interactor
        interactor.output = self
    }

    func loadNewAdvertisments() {
        interactor.loadAdvertisments()
        output?.startLoadingIndicator()
    }

}

//MARK: InteractorOutput

extension AdvertismentsPresenter: AdvertismentsInteractorOutput {

    func adsDidLoad(newAds: [Advertisment]) {
        DispatchQueue.main.async {
            self.ads += newAds
            self.output?.ads.append(contentsOf: newAds)
            self.output?.stopLoadingIndicator()
            self.output?.reload()
        }
    }

    func errorOccured(error: Error) {
        DispatchQueue.main.async {
            self.output?.presentError(error: error)
        }
    }

}
