//
//  CustomerTests.swift
//  ClientTests
//
//  Created by Mariana Meireles on 15/02/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import XCTest
import Nimble
@testable import CustomerRegistration

class CustomerTests: XCTestCase {
    
    private var customerUnderTest: CustomerModel!
    
    override func setUp() {
        super.setUp()
        customerUnderTest = CustomerModel(company: "Stone", owner: "Mariana Ribeiro Meireles Gerisztein")
    }
    
    override func tearDown() {
        customerUnderTest = nil
        super.tearDown()
    }
    
    func test_shouldGenerate_threeInicials() {
        let inicialsExpected = customerUnderTest.generateThreeInicials(name: customerUnderTest.owner)
        expect(inicialsExpected).to(match("MRM"))
    }
    
}
