//
//  AdvertisementsInterfaces.swift
//  Advertisments
//
//  Copyright © 2018 Mohamed Waly. All rights reserved.
//
//  VIPER Model Protocols Definitions

import Foundation

//MARK: Presenter Protocols

protocol AdvertismentsPresenterInput: class {
    var output: AdvertismentsPresenterOutput? { get set }
    func loadNewAdvertisments()
}

protocol AdvertismentsPresenterOutput: class  {
    var numberOfAds: Int { get }
    var ads: [Advertisment] { get set }
    func reload()
    func presentError(error: Error)
    //TODO: enhancemnt to have a call back from reload confirming operation is finished
    func startLoadingIndicator()
    func stopLoadingIndicator()
}

extension AdvertismentsPresenterOutput {

    var numberOfAds: Int { return ads.count }

}

//MARK: interactor Protocols

protocol AdvertismentsInteractorInput: class {
    var output: AdvertismentsInteractorOutput? { get set }
    func loadAdvertisments()
}

protocol AdvertismentsInteractorOutput: class  {
    var numberOfAds: Int { get }
    func adsDidLoad(newAds: [Advertisment])
    func errorOccured(error: Error)
}

//MARK: Data Manager

protocol AdvertismentsDataStore: class {
    func getAds(result: @escaping (Result<AdsResponseDTO>) -> Void)
}

