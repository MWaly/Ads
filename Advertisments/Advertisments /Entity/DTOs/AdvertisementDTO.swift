//
//  AdvertisementDTO.swift
//  Advertisments
//
//  Copyright © 2018 Mohamed Waly. All rights reserved.
//
//  Holds Non-Ommited Network Response Data Value For Advertisment Data Object

import Foundation

struct AdvertismentDTO: Codable {

    let id: Int?
    let title: String?
    let photo: PhotoDTO?

}
