//
//  NetworkService.swift
//  Advertisments
//
//  Copyright © 2018 Mohamed Waly. All rights reserved.
//
//  Responsible for calling network services

import Foundation

final class NetworkService {

    private lazy var session = URLSession.shared
    //TODO: proper init method with configuration
    private let defaultConfiguration = NetworkServiceConfigurator(baseUrl: "https://api.jsonbin.io/")
    private lazy var builder: RequestBuilder = RequestBuilder(configuration: defaultConfiguration)

    typealias AdvertismentsCompletion = (Result<AdsResponseDTO>) -> Void

}

// MARK: Service Calls

extension NetworkService {

    func getAdsInitally(limit: Int = 40, completion: @escaping AdvertismentsCompletion) {
        guard let request = builder.setupGetCallRequest(for: .adsPath) else { return }
        applyGetRequest(request, completion)
    }

    fileprivate func applyGetRequest(_ request: URLRequest, _ completion: @escaping NetworkService.AdvertismentsCompletion) {
        print("requesting now for url\(String(describing: request.url?.absoluteString))")
        let task = session.dataTask(with: request) { [weak self]
            (data, response, error) in
            guard let `self` = self else { return }
            guard error == nil else {
                let errorToPass = self.evaluate(error: error)
                completion(.failure(error: errorToPass))
                return
            }
            guard let responseData = data, let adObject = try? JSONDecoder().decode(AdsResponseDTO.self, from: responseData)
                else {
                    completion(.failure(error: NetworkError.parsing))
                    return
            }
            completion(Result.success(value: adObject))
        }

        task.resume()
    }

}

// MARK: Helpers

extension NetworkService {

    private func evaluate(error: Error?) -> NetworkError {
        //TODO: Handle more error cases
        guard let _ = error else { return .unknown }
        return .generic
    }

}

// MARK: Helper types

enum Result<T> {
    case success(value: T)
    case failure(error: Error)
}

enum endPoint: String {
    case adsPath = "b/5a78d81704b9c21255e40363"
}

enum NetworkError: Error {
    case generic
    case parsing
    case unknown
}

