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
    private var contact: Customer!
    
    override func setUp() {
        super.setUp()
        contact = Customer(ownerName: "Mariana Ribeiro Meireles Gerisztein", email: "mariana.meireles@stone.com.br", telephone: "999952123", companyName: "Stone", cnpj: "67076488000101", activeSince: "08/07/2017", isMei: true)
        customerUnderTest = CustomerRow(customer: contact)
    }
    
    override func tearDown() {
        contact = nil
        customerUnderTest = nil
        super.tearDown()
    }
    
    func test_shouldGenerate_threeInicials() {
        let inicialsExpected = customerUnderTest.generateThreeInicials(name: contact.ownerName!)
        expect(inicialsExpected).to(match("MRM"))
    }
    
    func test_shouldntGenerate_fourInicials() {
        let inicialsExpected = customerUnderTest.generateThreeInicials(name: contact.ownerName!)
        expect(inicialsExpected).notTo(match("MRMG"))
    }
    
    func test_shouldTransformContact_intoCustomerModel() {
        expect(self.contact.ownerName).to(match(customerUnderTest.ownerName))
        expect(self.contact.companyName).to(match(customerUnderTest.companyName))
    }
    
}
