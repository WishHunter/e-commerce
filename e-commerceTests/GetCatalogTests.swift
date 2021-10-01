//
//  GetCatalogTests.swift
//  e-commerceTests
//
//  Created by Denis Molkov on 01.10.2021.
//

import XCTest
@testable import e_commerce

class GetCatalogTests: XCTestCase {
    let expectation = XCTestExpectation(description: "Какая то хуйня из под коня")
    var requestFactory: RequestFactory!

    override func setUpWithError() throws {
        requestFactory = RequestFactory()
    }

    override func tearDownWithError() throws {
        requestFactory = nil
    }
    
    func testLoadCatalog() {
        let catalog = requestFactory.makeCatalogRequestFactory()
        
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

}
