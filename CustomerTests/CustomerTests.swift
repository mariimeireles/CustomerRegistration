//
//  CustomerTests.swift
//  CustomerTests
//
//  Created by Mariana Meireles | Stone on 2/20/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import XCTest
import Nimble
@testable import CustomerRegistration

class CustomerTests: XCTestCase {
    
    private var customerUnderTest: CustomerRow!
    private var customerModel: Customer!
    
    override func setUp() {
        super.setUp()
        customerModel = Customer(ownerName: "Mariana Ribeiro Meireles Gerisztein", email: "mariana.meireles@stone.com.br", telephone: "999952123", companyName: "Stone", CNPJ: "67076488000101", activeSince: Date(), isMei: true)
        customerUnderTest = CustomerRow(customer: customerModel)
    }
    
    override func tearDown() {
        customerModel = nil
        customerUnderTest = nil
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func test_shouldGenerate_threeInicials() {
        let inicialsExpected = customerUnderTest.generateThreeInicials(name: customerModel.ownerName)
        expect(inicialsExpected).to(match("MRM"))
    }
    
    func test_shouldntGenerate_fourInicials() {
        let inicialsExpected = customerUnderTest.generateThreeInicials(name: customerModel.ownerName)
        expect(inicialsExpected).notTo(match("MRMG"))
    }
    
}
