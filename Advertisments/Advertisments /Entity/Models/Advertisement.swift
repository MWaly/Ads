//
//  Advertisement.swift
//  Advertisments
//
//  Copyright © 2018 Mohamed Waly. All rights reserved.
//
//  Responsible for holding App Model for Advertisment object

struct Photo {
    let width: Float
    let height: Float
    let url: String
    
    var computedURL: String {
       var computedURL = url.replacingOccurrences(of: "{width}", with: String(Int(width)))
        computedURL = computedURL.replacingOccurrences(of: "{height}", with: String(Int(height)))
        return computedURL
    }

}

struct Advertisment {
    let id: Int
    let title: String
    let photo: Photo
}
