//
//  RegistrationViewModel.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 2/27/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation

class RegistrationViewModel {
    
    var registrationHeadline: RegistrationHeadline!
    private let headlineFetcher: RetrieveHeadlines

    init(fetcher: RetrieveHeadlines) {
        self.headlineFetcher = fetcher
        self.registrationHeadline = populateRows()
    }

    func populateRows() -> RegistrationHeadline {
        let headlineFetched = self.headlineFetcher.fetchHeadlines()
        let headline = RegistrationHeadline(headline: headlineFetched)
        return headline
    }

}

class RegistrationHeadline {
    
    var ownerName: String!
    var email: String!
    var telephone: String!
    var companyName: String!
    var cnpj: String!
    var activeSince: String!
    var pickDate: String!
    var isMei: String!
    
    init(headline: Headline) {
        self.ownerName = headline.ownerName
        self.email = headline.email
        self.telephone = headline.telephone
        self.companyName = headline.companyName
        self.cnpj = headline.cnpj
        self.activeSince = headline.activeSince
        self.pickDate = headline.pickDate
        self.isMei = headline.isMei
    }
}
