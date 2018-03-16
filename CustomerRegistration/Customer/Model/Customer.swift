//
//  CustomerModel.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles on 14/02/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation

class Customer {
    
    var ownerName: String?
    var email: String?
    var telephone: String?
    var companyName: String?
    var cnpj: String?
    var activeSince: String?
    var isMei: Bool?
    
    convenience init(ownerName: String, email: String, telephone: String, companyName: String, cnpj: String, activeSince: String, isMei: Bool) {
        self.init()
        self.ownerName = ownerName
        self.email = email
        self.telephone = telephone
        self.companyName = companyName
        self.cnpj = cnpj
        self.activeSince = activeSince
        self.isMei = isMei
    }
    
    convenience init (translatedCustomer: ClientTranslater) {
        self.init()
        self.ownerName = translatedCustomer.ownerName
        self.email = translatedCustomer.email
        self.telephone = translatedCustomer.telephone
        self.companyName = translatedCustomer.companyName
        self.cnpj = translatedCustomer.cnpj
        self.activeSince = translatedCustomer.activeSince
        self.isMei = translatedCustomer.isMei
    }
    
}
