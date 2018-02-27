//
//  NameValidatorTests.swift
//  NameValidatorTests
//
//  Created by Mariana Meireles | Stone on 2/26/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import XCTest
import Nimble
@testable import CustomerRegistration

class NameValidatorTests: XCTestCase {
    
    private var nameValidatorUnderTest: NameValidator!
    
    override func setUp() {
        super.setUp()
        nameValidatorUnderTest = NameValidator()
    }
    
    override func tearDown() {
        nameValidatorUnderTest = nil
        super.tearDown()
    }
    
    func test_shouldntAccept_anEmptyName() {
        let emptyName = ""
        let validation = nameValidatorUnderTest.validate(inputName: emptyName)
        expect(validation).to(beFalse())
    }
    
    func test_shouldntAccept_nameWithoutLastName() {
        let nameWithoutLastName = "Mariana "
        let validation = nameValidatorUnderTest.validate(inputName: nameWithoutLastName)
        expect(validation).to(beFalse())
    }

    func test_shouldntAccept_lastNameWhithoutName() {
        let lastNameWithoutName = " Meireles"
        let validation = nameValidatorUnderTest.validate(inputName: lastNameWithoutName)
        expect(validation).to(beFalse())
    }

    func test_shouldntAccept_lessCharacters() {
        let lessCharacters = "Ana"
        let validation = nameValidatorUnderTest.validate(inputName: lessCharacters)
        expect(validation).to(beFalse())
    }

    func test_shouldntAccept_moreCharacters() {
        let moreCharacters = "aaaaaaaaaa bbbbbbbbbb cccccccccc dddddddddd eeeeeeeeee ffffffffff g"
        let validation = nameValidatorUnderTest.validate(inputName: moreCharacters)
        expect(validation).to(beFalse())
    }

    func test_shouldAccept_validName() {
        let validName = "Mariana Ribeiro Meireles"
        let validation = nameValidatorUnderTest.validate(inputName: validName)
        expect(validation).to(beTrue())
    }
    
}
