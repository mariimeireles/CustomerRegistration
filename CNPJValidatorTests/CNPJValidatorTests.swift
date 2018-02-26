//
//  CNPJValidatorTests.swift
//  CNPJValidatorTests
//
//  Created by Mariana Meireles | Stone on 2/26/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import XCTest
import Nimble
@testable import CustomerRegistration

class CNPJValidatorTests: XCTestCase {
    
    private var cnpjValidatorUnderTest: CNPJValidator!
    
    override func setUp() {
        super.setUp()
        cnpjValidatorUnderTest = CNPJValidator()
    }
    
    override func tearDown() {
        cnpjValidatorUnderTest = nil
        super.tearDown()
    }
    
    func test_shouldntAccept_emptyCNPJ() {
        let emptyCNPJ = ""
        let validation = cnpjValidatorUnderTest.validate(inputCNPJ: emptyCNPJ)
        expect(validation).to(beFalse())
    }
    
    func test_shouldntAccept_alphanumericCNPJ() {
        let alphanumericCNPJ = "a1b2c3d4e5f6g7"
        let validation = cnpjValidatorUnderTest.validate(inputCNPJ: alphanumericCNPJ)
        expect(validation).to(beFalse())
    }
    
    func test_shouldntAccept_lessDigits() {
        let lessDigits = "86.639.760"
        let validation = cnpjValidatorUnderTest.validate(inputCNPJ: lessDigits)
        expect(validation).to(beFalse())
    }
    
    func test_shouldntAccept_moreDigits() {
        let moreDigits = "86.639.760/0001-698"
        let validation = cnpjValidatorUnderTest.validate(inputCNPJ: moreDigits)
        expect(validation).to(beFalse())
    }
    
    func test_shouldntAccept_invalidCNPJ() {
        let invalidCNPJ = "86.639.760/0001-68"
        let validation = cnpjValidatorUnderTest.validate(inputCNPJ: invalidCNPJ)
        expect(validation).to(beFalse())
    }
    
    func test_shouldAccept_validCNPJ() {
        let validCNPJ = "86.639.760/0001-69"
        let validation = cnpjValidatorUnderTest.validate(inputCNPJ: validCNPJ)
        expect(validation).to(beTrue())
    }
    
}
