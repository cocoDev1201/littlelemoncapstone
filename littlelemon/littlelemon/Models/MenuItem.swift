//
//  MenuItem.swift
//  littlelemon
//
//  Created by Emre Ülkem on 23.04.2023.
//

import Foundation

struct MenuItem: Codable, Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var price: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case image = "image"
        case price = "price"
    }
}

