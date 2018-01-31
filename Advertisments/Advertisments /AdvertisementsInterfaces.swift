//
//  AdvertisementsInterfaces.swift
//  Advertisments
//
//  Created by Mohamed Waly on 31.01.18.
//  Copyright © 2018 Mohamed Waly. All rights reserved.
//  Code Not Allowed To be Copied or Redistrubted Without permission for commerical use

import Foundation

protocol AdvertismentsPresenterInput {

    var ads: [Any] { get }
    func loadNewAdvertisments()

}
protocol AdvertismentsPresenterOutput {

    associatedtype T
    var numberOfAds: Int { get }

    func addAds(newAds: [T])
    func presentError(error: Error)
    func startLoadingIndicator()
    func stopLoadingIndicator()

}
protocol AdvertismentsInteractorInput {

    var currentPage: Int { get }

    func loadAdvertisments(starting page: Int)

}
protocol AdvertismentsInteractorOutput {


    var numberOfAds: Int { get }
    func adsDidLoad(newAds: [Any])
    func errorOccured(error: Error)

}


protocol AdvertismentsDataStore {

    func getAds(starting page: Int,  result: @autoclosure () -> Void)

}

