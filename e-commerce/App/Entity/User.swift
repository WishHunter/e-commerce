//
//  User.swift
//  e-commerce
//
//  Created by Denis Molkov on 26.09.2021.
//

import Foundation

struct User: Codable {
    let idUser: Int
    let login: String
    let name: String
    let lastname: String

    enum CodingKeys: String, CodingKey {
        case idUser = "id_user"
        case login = "user_login"
        case name = "user_name"
        case lastname = "user_lastname"
    }
}
