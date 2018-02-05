//
//  RequestBuilder.swift
//  Advertisments
//
//  Copyright © 2018 Mohamed Waly. All rights reserved.
//
//  Responsible for building requests aaccording to configuration provided

import Foundation

final class RequestBuilder {

    private let configuration: NetworkServiceConfigurator

    init(configuration: NetworkServiceConfigurator) {
        self.configuration = configuration
    }

    func buildGetRequest(_ url: URL) -> URLRequest? {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        let bodyStr = "limit=40"
        request.httpBody = bodyStr.data(using: .utf8)

        return request
    }

    func setupGetCallRequest(for path: endPoint) -> URLRequest? {
        guard let url = URL(string: configuration.baseUrl + endPoint.adsPath.rawValue) else {
            return nil
        }
        return buildGetRequest(url)
    }
    
}
