//
//  PhoneValidatorTests.swift
//  PhoneValidatorTests
//
//  Created by Mariana Meireles | Stone on 2/26/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import XCTest
import Nimble
@testable import CustomerRegistration

class PhoneValidatorTests: XCTestCase {
    
    private var phoneValidatorUnderTest: PhoneValidator!
    
    override func setUp() {
        super.setUp()
        phoneValidatorUnderTest = PhoneValidator()
    }
    
    override func tearDown() {
        phoneValidatorUnderTest = nil
        super.tearDown()
    }
    
    func test_shouldntAccept_shortNumber() {
        let shortNumber = "(21) 99995"
        let validation = phoneValidatorUnderTest.validate(inputNumber: shortNumber)
        expect(validation).to(beFalse())
    }
    
    func test_shouldntAccept_longNumber() {
        let longNumber = "(21) 99995-21234"
        let validation = phoneValidatorUnderTest.validate(inputNumber: longNumber)
        expect(validation).to(beFalse())
    }
    
    func test_shouldntAccept_invalidDDD() {
        let invalidDDD = "(05) 99995-21234"
        let validation = phoneValidatorUnderTest.validate(inputNumber: invalidDDD)
        expect(validation).to(beFalse())
    }
    
    func test_shouldAccept_validNumber() {
        let validNumber = "(21) 99995-2123"
        let validation = phoneValidatorUnderTest.validate(inputNumber: validNumber)
        expect(validation).to(beTrue())
    }
    
}
