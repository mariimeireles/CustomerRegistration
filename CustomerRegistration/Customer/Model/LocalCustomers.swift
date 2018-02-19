//
//  LocalCustomers.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 2/19/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation

class LocalCustomers {
    
    func getAllCustomers() -> [Customer] {
        var customers = [Customer]()
        customers.append(Customer(ownerName: "Mark Zuckerberg", email: "mark@zuckerberg.com", telephone: "123456789", companyName: "Facebook Co.", CNPJ: "85814550000105", isMei: false))
        customers.append(Customer(ownerName: "Mark Zuckerberg", email: "mark@zuckerberg.com", telephone: "123456789", companyName: "Instagram", CNPJ: "85814550000105", isMei: false))
        customers.append(Customer(ownerName: "Evan Spiegel", email: "evan@spiegel.com", telephone: "123456789", companyName: "SnapChat", CNPJ: "87431294000194", isMei: true))
        customers.append(Customer(ownerName: "Jack Dorsey‎", email: "jack@dorsey‎.com", telephone: "123456789", companyName: "Twitter", CNPJ: "18625995000141", isMei: true))

        return customers
    }
    
}
