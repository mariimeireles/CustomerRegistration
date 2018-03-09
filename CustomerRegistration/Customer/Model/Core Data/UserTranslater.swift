//
//  ClientTranslater.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 2/23/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation

import Foundation
import CoreData

struct ClientTranslater: Equatable {
    
    var ownerName: String
    var email: String
    var telephone: String
    var companyName: String
    var cnpj: String
    var activeSince: String
    var isMei: Bool
}

func ==(lhs: ClientTranslater, rhs: ClientTranslater) -> Bool {
    return lhs.ownerName == rhs.ownerName && lhs.email == rhs.email && lhs.telephone == rhs.telephone && lhs.companyName == rhs.companyName && lhs.cnpj == rhs.cnpj && lhs.activeSince == rhs.activeSince && lhs.isMei == rhs.isMei
}

extension ClientTranslater {
    init(managedCustomer: Client) {
        self.ownerName = managedCustomer.value(forKeyPath: "ownerName") as! String
        self.email = managedCustomer.value(forKeyPath: "email") as! String
        self.telephone = managedCustomer.value(forKeyPath: "telephone") as! String
        self.companyName = managedCustomer.value(forKeyPath: "companyName") as! String
        self.cnpj = managedCustomer.value(forKeyPath: "cnpj") as! String
        self.activeSince = managedCustomer.value(forKeyPath: "activeSince") as! String
        self.isMei = managedCustomer.value(forKeyPath: "isMei") as! Bool
    }
}

struct CustomerTranslater: Equatable {
    
    var ownerName: String?
    var email: String?
    var telephone: String?
    var companyName: String?
    var cnpj: String?
    var activeSince: String?
    var isMei: Bool
}

func ==(lhs: CustomerTranslater, rhs: CustomerTranslater) -> Bool {
    return lhs.ownerName == rhs.ownerName && lhs.email == rhs.email && lhs.telephone == rhs.telephone && lhs.companyName == rhs.companyName && lhs.cnpj == rhs.cnpj && lhs.activeSince == rhs.activeSince && lhs.isMei == rhs.isMei
}

extension CustomerTranslater {
    init(client: Client, customer: Customer) {
        client.ownerName = customer.ownerName
//        self.ownerName = customer.ownerName!
//        self.email = customer.email!
//        self.telephone = customer.telephone!
//        self.companyName = customer.companyName!
//        self.cnpj = customer.cnpj!
//        self.activeSince = customer.activeSince!
//        self.isMei = customer.isMei!
    }
}
