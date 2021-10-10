//
//  AddToBasketRequestFactory.swift
//  e-commerce
//
//  Created by Denis Molkov on 10.10.2021.
//

import Foundation
import Alamofire

protocol AddToBasketRequestFactory {
    func addToBasket(idProduct: Int, quantity: Int, completionHandler: @escaping (AFDataResponse<AddToBasketResult>) -> Void)
}
