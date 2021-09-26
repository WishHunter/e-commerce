//
//  AbstractErrorParser.swift
//  e-commerce
//
//  Created by Denis Molkov on 26.09.2021.
//

import Foundation

protocol AbstractErrorParser {
    func parse(_ result: Error) -> Error
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}
