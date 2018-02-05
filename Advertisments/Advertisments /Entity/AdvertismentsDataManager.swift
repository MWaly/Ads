//
//  AdvertismentsDataSource.swift
//  Advertisments
//
//  Responsible for implementing interfaces for interactor with data 

import Foundation

final class AdvertismentsDataManager: AdvertismentsDataStore {

    private let networkService = NetworkService()

    func getAds(result: @escaping (Result<AdsResponseDTO>) -> Void) {
        networkService.getAdsInitally(completion: result)
    }

}
