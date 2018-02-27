//
//  RegistrationViewModel.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 2/27/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation

class RegistrationViewModel {
    
    var registrationHeadline: Headline!
    private let headlineFetcher: RetrieveHeadlines

    init(fetcher: RetrieveHeadlines) {
        self.headlineFetcher = fetcher
        self.registrationHeadline = populateHeadline()
    }

    func populateHeadline() -> Headline {
        let headlineFetched = self.headlineFetcher.fetchHeadlines()
        return headlineFetched
    }

}
