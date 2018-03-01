//
//  LocalCustomers.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 2/19/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation

class InMemoryContacts: RetrieveContacts {
    
    func fetchCustomers() -> [Customer] {
        return [
          Customer(ownerName: "Mark Zuckerberg", email: "mark@zuckerberg.com", telephone: "123456789", companyName: "Facebook Co.", cnpj: "85814550000105", activeSince: "04/02/2009", isMei: false),
          Customer(ownerName: "Mark Zuckerberg", email: "mark@zuckerberg.com", telephone: "123456789", companyName: "Facebook Co.", cnpj: "85814550000105", activeSince: "04/02/2009", isMei: false),
          Customer(ownerName: "Mark Zuckerberg", email: "mark@zuckerberg.com", telephone: "123456789", companyName: "Instagram", cnpj: "85814550000105", activeSince: "04/02/2009", isMei: false),
          Customer(ownerName: "Mark Zuckerberg", email: "mark@zuckerberg.com", telephone: "123456789", companyName: "Instagram", cnpj: "85814550000105", activeSince: "04/02/2009", isMei: false)
        ]
    }
    
}
