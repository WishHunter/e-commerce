//
//  GetBasketRequestFactory.swift
//  e-commerce
//
//  Created by Denis Molkov on 10.10.2021.
//

import Foundation
import Alamofire

protocol GetBasketRequestFactory {
    func getBasket(idUser: Int, completionHandler: @escaping (AFDataResponse<Basket>) -> Void)
}
