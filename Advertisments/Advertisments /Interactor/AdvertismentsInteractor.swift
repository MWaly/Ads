//
//  AdvertismentsInteractor.swift
//  Advertisments
//
//  Copyright © 2018 Mohamed Waly. All rights reserved.
//

import Foundation

final class AdvertismentsInteractor: AdvertismentsInteractorInput {
    var isLoading = false
    var nextURL: String? = nil
    weak var output: AdvertismentsInteractorOutput? = nil
    var dataManager: AdvertismentsDataStore = AdvertismentsDataManager()

    func loadAdvertisments() {
        guard !isLoading else { return }
        defer { isLoading = true }
        loadAdvertisments(starting: 0)
        return
    }

    private func handleResponse() -> (Result<AdsResponseDTO>) -> Void {
        return {
            [weak self] responseDTO in
            guard let `self` = self else { return }
            defer { self.isLoading = false }
            switch responseDTO {
            case .success(let response):
                self.output?.adsDidLoad(newAds: self.resolveAds(for: response.ads))
            case .failure(error: let error):
                self.output?.errorOccured(error: error)
            }
        }
    }

    private func loadAdvertisments(starting offset: Int) {
        dataManager.getAds(result: handleResponse())
    }

}

//MARK: HELPERS

extension AdvertismentsInteractor {

    //TODO: move this to mapper class
    func resolveAds(for adsArray: [AdvertismentDTO]?) -> [Advertisment] {
        guard let arrayOfAds = adsArray else { return [] }
        return arrayOfAds.flatMap { (value: AdvertismentDTO) -> Advertisment? in
               guard let identfier = value.id,
                let title = value.title,
                let photo = value.photo,
                let photoObj = extractPhoto(dto: photo)
                else { return nil }
            return Advertisment(id: identfier, title: title, photo: photoObj)
        }
    }

    private func extractPhoto(dto: PhotoDTO) -> Photo? {
        guard let width = dto.width,
            let height = dto.height,
            let link = dto.link
            else { return nil }
       return Photo(width: width, height: height, url: link)
    }

}
