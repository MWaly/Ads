//
//  AdvertismentsDataManagerTests.swift
//  Advertisments
//
//  Copyright © 2018 Mohamed Waly. All rights reserved.
//

import XCTest
@testable import Advertisments

class AdvertismentsDataManagerTests: XCTestCase {

    let dataStore = AdvertismentsDataSourceMock()

    func test_whenResponseParsed_CorrectValuesMapped() {
        let expectation = XCTestExpectation(description: "Parsing expectation")
        dataStore.getAds { result in
            switch result {
            case .success(let response):
                self.testData(from: response)
                expectation.fulfill()
            default:
                XCTFail()
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 4)
    }

    private func testData(from response: AdsResponseDTO) {
        XCTAssertEqual(response.ads!.count, 13)
        let firstAd = response.ads?.first
        XCTAssertEqual(firstAd?.title, "First Ad Title")
        XCTAssertEqual(firstAd?.id, 1)
        XCTAssertNotNil(firstAd?.photo)
        testPhoto(from: (firstAd?.photo)!)
    }

    private func testPhoto(from photo: PhotoDTO) {
        XCTAssertEqual(photo.id, 1)
        XCTAssertEqual(photo.height, 150)
        XCTAssertEqual(photo.width, 150)
        XCTAssertEqual(photo.link, "https://picsum.photos/150/150?image=0")
    }

}

final class AdvertismentsDataSourceMock: AdvertismentsDataStore {

    func getAds(result: @escaping (Result<AdsResponseDTO>) -> Void) {
        if let path = Bundle.main.path(forResource: "AdvertisementResponse", ofType: "json") {
            let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            guard let parsedData = data else { return }
            do {
                let adObject = try JSONDecoder().decode(AdsResponseDTO.self, from: parsedData)
                result(Result.success(value: adObject))
            } catch let error {
                result(Result.failure(error: error))
            }
        }
    }

}
