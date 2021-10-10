//
//  AddReviewRequestFactory.swift
//  e-commerce
//
//  Created by Denis Molkov on 05.10.2021.
//

import Foundation
import Alamofire

protocol AddReviewRequestFactory {
    func addReview(idUser: Int, comment: String, completionHandler: @escaping (AFDataResponse<AddReviewResult>) -> Void)
}
