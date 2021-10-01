//
//  Product.swift
//  e-commerce
//
//  Created by Denis Molkov on 01.10.2021.
//

import Foundation

struct Product: Codable {
    let idProduct: Int
    let productName: String
    let price: Int
    
    enum CodingKeys: String, CodingKey {
        case idProduct = "id_product"
        case productName = "product_name"
        case price = "price"
    }
}
