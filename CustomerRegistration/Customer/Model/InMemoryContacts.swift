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
        var customers = [Customer]()
        customers.append(Customer(ownerName: "Mark Zuckerberg", email: "mark@zuckerberg.com", telephone: "123456789", companyName: "Facebook Co.", cnpj: "85814550000105", activeSince: Date(), isMei: false))
        customers.append(Customer(ownerName: "Mark Zuckerberg", email: "mark@zuckerberg.com", telephone: "123456789", companyName: "Instagram", cnpj: "85814550000105", activeSince: Date(), isMei: false))
        customers.append(Customer(ownerName: "Evan Spiegel", email: "evan@spiegel.com", telephone: "123456789", companyName: "SnapChat", cnpj: "87431294000194", activeSince: Date(), isMei: true))
        customers.append(Customer(ownerName: "Jack Dorsey‎", email: "jack@dorsey‎.com", telephone: "123456789", companyName: "Twitter", cnpj: "18625995000141", activeSince: Date(), isMei: true))

        return customers
    }
    
}
