//
//  ResponseCodableTests.swift
//  e-commerceTests
//
//  Created by Denis Molkov on 30.09.2021.
//

import XCTest
import Alamofire
@testable import e_commerce

struct PostStub: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

enum ApiErrorStub: Error {
    case fatalError
}

struct ErrorParserStub: AbstractErrorParser {
    func parse(_ result: Error) -> Error {
        return ApiErrorStub.fatalError
    }
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error
    }
}

class ResponseCodableTests: XCTestCase {
    let expectation = XCTestExpectation(description: "Download https://protected-coast-09329.herokuapp.com/auth")
    var errorParser: ErrorParserStub!

    override func setUpWithError() throws {
        errorParser = ErrorParserStub()
    }

    override func tearDownWithError() throws {
        errorParser = nil
    }

    func testShouldDownloadAndParse() {
            AF
                .request("https://protected-coast-09329.herokuapp.com/auth")
                .responseCodable(errorParser: errorParser) { [weak self] (response: AFDataResponse<PostStub>) in
                    switch response.result {
                    case .success(_): break
                    case .failure:
                        XCTFail()
                    }
                    self?.expectation.fulfill()
            }
            wait(for: [expectation], timeout: 10.0)
        }
}
