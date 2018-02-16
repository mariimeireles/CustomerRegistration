//
//  ClientTests.swift
//  ClientTests
//
//  Created by Mariana Meireles on 15/02/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import XCTest
import Nimble
@testable import CustomerRegistration

class ClientTests: XCTestCase {
    
    private var clientUnderTest: ClientModel!
    
    override func setUp() {
        super.setUp()
        clientUnderTest = ClientModel(company: "Stone", owner: "Mariana Ribeiro Meireles Gerisztein")
    }
    
    override func tearDown() {
        clientUnderTest = nil
        super.tearDown()
    }
    
    func test_shouldGenerate_threeInicials() {
        let inicialsExpected = clientUnderTest.generateThreeInicials(name: clientUnderTest.owner)
        expect(inicialsExpected).to(match("MRM"))
    }
    
}
