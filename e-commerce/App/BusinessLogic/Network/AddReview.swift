//
//  AddReview.swift
//  e-commerce
//
//  Created by Denis Molkov on 05.10.2021.
//

import Foundation
import Alamofire

class AddReview: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(
        string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!

    init(errorParser: AbstractErrorParser,
         sessionManager: Session,
         queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension AddReview: AddReviewRequestFactory {
    func addReview(idUser: Int,
                   comment: String,
                   completionHandler: @escaping (AFDataResponse<AddReviewResult>) -> Void) {
        let requestModel = AddReviewRequest(baseUrl: baseUrl, idUser: idUser, comment: comment)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension AddReview {
    struct AddReviewRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "addReview.json"
        let idUser: Int
        let comment: String
        var parameters: Parameters? {
            return [
                "id_user": idUser,
                "text": comment
            ]
        }
    }
}
