//
//  MenuList.swift
//  littlelemon
//
//  Created by Emre Ülkem on 23.04.2023.
//

import Foundation
import CoreData

struct MenuList: Decodable {
    let menu = [MenuItem]
    
    enum CodingKeys: String, CodingKey {
        case menu = "menu"
    }
}


