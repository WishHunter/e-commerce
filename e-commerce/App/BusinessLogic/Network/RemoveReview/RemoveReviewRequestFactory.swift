//
//  RemoveReviewRequestFactory.swift
//  e-commerce
//
//  Created by Denis Molkov on 05.10.2021.
//

import Foundation
import Alamofire

protocol RemoveReviewRequestFactory {
    func removeReview(idComment: Int, completionHandler: @escaping (AFDataResponse<RemoveReviewResult>) -> Void)
}
