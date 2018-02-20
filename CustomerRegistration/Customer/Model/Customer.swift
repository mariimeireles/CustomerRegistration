//
//  CustomerModel.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles on 14/02/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation

struct Customer {
    
    var ownerName: String
    var email: String
    var telephone: String
    var companyName: String
    var CNPJ: String
    var activeSince: Date
    var isMei: Bool
    
    init(ownerName: String, email: String, telephone: String, companyName: String, CNPJ: String, activeSince: Date, isMei: Bool) {
        self.ownerName = ownerName
        self.email = email
        self.telephone = telephone
        self.companyName = companyName
        self.CNPJ = CNPJ
        self.activeSince = activeSince
        self.isMei = isMei
    }
    
}
