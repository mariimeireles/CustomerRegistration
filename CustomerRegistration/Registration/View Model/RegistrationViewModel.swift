//
//  RegistrationViewModel.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 2/27/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation

class RegistrationViewModel {
    
    var registrationHeadline: [RegistrationCellProtocol]!
    private let headlinesFetcher: RetrieveHeadlines
    
    init(fetcher: RetrieveHeadlines) {
        self.headlinesFetcher = fetcher
        self.registrationHeadline = populateHeadline()
    }
    
    func populateHeadline() -> [RegistrationCellProtocol] {
        return self.headlinesFetcher.fetchHeadlines()
    }
}


