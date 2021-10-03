//
//  GetRequestsTests.swift
//  e-commerceTests
//
//  Created by Denis Molkov on 01.10.2021.
//

import XCTest
import Alamofire
@testable import e_commerce

class GetRequestsTests: XCTestCase {
    let expectation = XCTestExpectation(description: "")
    var requestFactory: RequestFactory!
    var errorParser: AbstractErrorParser!
    var commonSession: Session!
    var sessionQueue: DispatchQueue!

    override func setUpWithError() throws {
        requestFactory = RequestFactory()
        errorParser = ErrorParser()
        sessionQueue = DispatchQueue.global(qos: .utility)
        commonSession = {
            let configuration = URLSessionConfiguration.default
            configuration.httpShouldSetCookies = false
            configuration.headers = .default
            let manager = Session(configuration: configuration)
            return manager
        }()
    }

    override func tearDownWithError() throws {
        requestFactory = nil
        errorParser = nil
        sessionQueue = nil
        commonSession = nil
    }
    
    func testLoadCatalog() {
        let catalog = LoadCatalog(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
        
        catalog.getCatalog(pageNumber: 1) {[weak self] response in
            switch response.result {
            case .success(_):
                break
            case .failure(_):
                XCTFail()
            }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testLoadProduct() {
        let auth = Auth(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
        
        auth.baseUrl = URL(string: "https://protected-coast-09329.herokuapp.com/auth")!

        auth.login(userName: "Somebody", password: "mypassword") {[weak self] response in
            switch response.result {
            case .success(_):
                break
            case .failure(_):
                XCTFail()
            }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }

}
