//
//  ProductInBasket.swift
//  e-commerce
//
//  Created by Denis Molkov on 10.10.2021.
//

import Foundation


struct ProductInBasket: Codable {
    let idProduct: Int
    let productName: String
    let price: Int
    let quantity: Int

    enum CodingKeys: String, CodingKey {
        case idProduct = "id_product"
        case productName = "product_name"
        case price = "price"
        case quantity = "quantity"
    }
}
