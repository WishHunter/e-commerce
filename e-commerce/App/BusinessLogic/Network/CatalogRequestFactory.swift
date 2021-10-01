//
//  CatalogRequestFactory.swift
//  e-commerce
//
//  Created by Denis Molkov on 01.10.2021.
//

import Foundation
import Alamofire

protocol CatalogRequestFactory {
    func getCatalog(pageNumber: Int, completionHandler: @escaping (AFDataResponse<[Product]>) -> Void)
}
