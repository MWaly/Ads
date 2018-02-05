//
//  PhotoDTO.swift
//  Advertisments
//
//  Copyright © 2018 Mohamed Waly. All rights reserved.
//
//  Responsible for holding of PhotoDTO 

import Foundation

struct PhotoDTO: Codable {

    let id: Int?
    let width: Float?
    let height: Float?
    let link: String?

    init(id: Int?, width: Float?, height: Float?, link: String?) {
        self.id = id
        self.width = width
        self.height = height
        self.link = link
    }

}
