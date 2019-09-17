//
//  Mobile.swift
//  MobilePhoneBuyer’sGuide
//
//  Created by Aksorn Khantasit on 16/9/2562 BE.
//  Copyright © 2562 Aksorn. All rights reserved.
//

import Foundation

struct Mobile: Codable {
    let id: Int
    let name: String
    let description: String
    let thumbImageURL: String
    let price: Float
    let rating: Float
}
