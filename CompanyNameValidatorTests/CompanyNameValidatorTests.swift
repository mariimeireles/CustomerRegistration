//
//  CompanyNameValidatorTests.swift
//  CompanyNameValidatorTests
//
//  Created by Mariana Meireles | Stone on 2/26/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import XCTest
import Nimble
@testable import CustomerRegistration

class CompanyNameValidatorTests: XCTestCase {
    
    private var companyNameValidatorUnderTest: CompanyNameValidator!
    
    override func setUp() {
        super.setUp()
        companyNameValidatorUnderTest = CompanyNameValidator()
    }
    
    override func tearDown() {
        companyNameValidatorUnderTest = nil
        super.tearDown()
    }
    
    func test_shouldntAccept_lessCharacters() {
        let lessCharacters = "O"
        let validation = companyNameValidatorUnderTest.validate(inputCompany: lessCharacters)
        expect(validation).to(beFalse())
    }
    
    func test_shouldAccept_validName() {
        let validName = "Caras"
        let validation = companyNameValidatorUnderTest.validate(inputCompany: validName)
        expect(validation).to(beTrue())
    }
    
}
