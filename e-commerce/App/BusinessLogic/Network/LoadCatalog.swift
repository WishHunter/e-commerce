//
//  LoadCatalog.swift
//  e-commerce
//
//  Created by Denis Molkov on 01.10.2021.
//

import Foundation
import Alamofire

class LoadCatalog: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(errorParser: AbstractErrorParser,
         sessionManager: Session,
         queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension LoadCatalog: CatalogRequestFactory {
    func getCatalog(pageNumber: Int, completionHandler: @escaping (AFDataResponse<[Product]>) -> Void) {
        let requestModel = GetCatalog(baseUrl: baseUrl, pageNumber: pageNumber)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension LoadCatalog {
    struct GetCatalog: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "catalogData.json"
        
        let pageNumber: Int
        
        var parameters: Parameters? {
            return [
                "page_number": pageNumber
            ]
        }
    }
}
