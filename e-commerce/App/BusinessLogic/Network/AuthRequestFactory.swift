//
//  AuthRequestFactory.swift
//  e-commerce
//
//  Created by Denis Molkov on 26.09.2021.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
}
