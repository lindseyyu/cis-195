//
//  Data.swift
//  NationalParks
//
//  Created by user181204 on 11/12/20.
//

import Foundation

struct APIResponse: Codable {
    let data: [Park]
}

struct Park: Codable {
    let name: String
    let designation: String
    let images: [Image]
    let description: String
}

struct Image: Codable {
    let url: String
}
