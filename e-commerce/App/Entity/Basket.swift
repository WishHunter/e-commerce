//
//  Basket.swift
//  e-commerce
//
//  Created by Denis Molkov on 10.10.2021.
//

import Foundation

struct Basket: Codable {
    let amount: Int
    let countGoods: Int
    let contents: [ProductInBasket]
}
