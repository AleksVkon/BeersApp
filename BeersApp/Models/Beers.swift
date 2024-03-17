//
//  Beers.swift
//  BeersApp
//
//  Created by Aleksey Konchyts on 17.03.24.
//

import Foundation

struct Beers: Decodable {
    let name: String
    let tagline: String
    let description: String
    let image_url: String
    let food_pairing: String
    let brewers_tips: String
    
}
