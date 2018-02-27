//
//  RegistrationTests.swift
//  RegistrationTests
//
//  Created by Mariana Meireles | Stone on 2/27/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import XCTest
import Nimble
@testable import CustomerRegistration

class RegistrationTests: XCTestCase {
    
    private var headlineUnderTest: RegistrationHeadline!
    private var headline: Headline!
    
    override func setUp() {
        super.setUp()
        headline = Headline(ownerName: "Owner Name", email: "Email", telephone: "Phone for contact", companyName: "Company Name", cnpj: "CNPJ", activeSince: "Active since", pickDate: "choose", isMei: "Is MEI?")
        headlineUnderTest = RegistrationHeadline(headline: headline)
    }
    
    override func tearDown() {
        headline = nil
        headlineUnderTest = nil
        super.tearDown()
    }
    
    func test_shouldTransformHeadline_intoHeadlineModel() {
        expect(self.headline.ownerName).to(match(headlineUnderTest.ownerName))
        expect(self.headline.email).to(match(headlineUnderTest.email))
        expect(self.headline.telephone).to(match(headlineUnderTest.telephone))
        expect(self.headline.companyName).to(match(headlineUnderTest.companyName))
        expect(self.headline.cnpj).to(match(headlineUnderTest.cnpj))
        expect(self.headline.activeSince).to(match(headlineUnderTest.activeSince))
        expect(self.headline.pickDate).to(match(headlineUnderTest.pickDate))
        expect(self.headline.isMei).to(match(headlineUnderTest.isMei))
    }
    
}
