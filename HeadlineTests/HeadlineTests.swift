//
//  HeadlineTests.swift
//  HeadlineTests
//
//  Created by Mariana Meireles | Stone on 2/26/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import XCTest
import Nimble
@testable import CustomerRegistration

class HeadlineTests: XCTestCase {
    
    private var inMemoryHeadlines: InMemoryHeadlines!
    private var headline: Headline!
    
    override func setUp() {
        super.setUp()
        inMemoryHeadlines = InMemoryHeadlines()
    }
    
    override func tearDown() {
        inMemoryHeadlines = nil
        super.tearDown()
    }
    
    func test_shouldntAccept_emptyHeadline() {
        let emptyHeadline = Headline(ownerName: "", email: "", telephone: "", companyName: "", cnpj: "", activeSince: "", pickDate: "", isMei: "")
        let validation = inMemoryHeadlines.fetchHeadlines()
        expect(emptyHeadline.ownerName).notTo(equal(validation.ownerName))
    }
    
}
