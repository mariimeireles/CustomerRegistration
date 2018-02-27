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
    
    private var headlineUnderTest: RegistrationViewModel!
    private var headline: Headline!
    private var inMemoryHeadlines: InMemoryHeadlines!
    
    override func setUp() {
        super.setUp()
        headline = Headline(ownerName: "Owner Name", email: "Email", telephone: "Phone for contact", companyName: "Company Name", cnpj: "CNPJ", activeSince: "Active since", pickDate: "choose", isMei: "Is MEI?")
        inMemoryHeadlines = InMemoryHeadlines()
        headlineUnderTest = RegistrationViewModel(fetcher: inMemoryHeadlines)
    }
    
    override func tearDown() {
        headline = nil
        inMemoryHeadlines = nil
        headlineUnderTest = nil
        super.tearDown()
    }
    
    func test_shouldFetchHeadline() {
        let headlineFetched = self.headlineUnderTest.populateHeadline()
        expect(self.headline.ownerName).to(match(headlineFetched.ownerName))
        expect(self.headline.email).to(match(headlineFetched.email))
        expect(self.headline.telephone).to(match(headlineFetched.telephone))
        expect(self.headline.companyName).to(match(headlineFetched.companyName))
        expect(self.headline.cnpj).to(match(headlineFetched.cnpj))
        expect(self.headline.activeSince).to(match(headlineFetched.activeSince))
        expect(self.headline.pickDate).to(match(headlineFetched.pickDate))
    }
}
