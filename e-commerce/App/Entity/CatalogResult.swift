//
//  CatalogResult.swift
//  e-commerce
//
//  Created by Denis Molkov on 01.10.2021.
//

import Foundation

struct CatalogResult: Codable {
    let products: [Product]
    
    enum CodingKeys: String, CodingKey {
        case products = ""
    }
}
