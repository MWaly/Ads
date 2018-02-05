//
//  AdsResponseDTO.swift
//  Advertisments
//
//  Copyright © 2018 Mohamed Waly. All rights reserved.
//
//  Responsible for holding of DTO of Get Ads Response 

import Foundation

struct AdsResponseDTO: Codable {

    let ads: [AdvertismentDTO]?

    enum CodingKeys: String, CodingKey {
        case ads = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        ads = try values.decodeIfPresent([AdvertismentDTO].self, forKey: .ads)
    }

}
