//
//  APIFactory.swift
//  e-commerce
//
//  Created by Denis Molkov on 10.10.2021.
//

import Foundation

class APIFactory {
    
    func payBusket() -> PayBasketAPIFactory {
        return PayBasket()
    }
}
