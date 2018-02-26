//
//  InMemoryHeadlines.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 2/26/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation

class InMemoryHeadlines: RetrieveHeadlines {
    
    func fetchHeadlines() -> Headline {
        var headLine = Headline(Headline(ownerName: "Owner Name", email: "Email", telephone: "Phone for contact", companyName: "Company Name", cnpj: "CNPJ", activeSince: "Active since", pickDate: "choose", isMei: "Is MEI?")
        
        return headLine
    }
    
}
