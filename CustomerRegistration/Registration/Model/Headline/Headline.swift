//
//  Headline.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 2/26/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation

class Headline {
    
    var ownerName: String?
    var email: String?
    var telephone: String?
    var companyName: String?
    var cnpj: String?
    var activeSince: String?
    var pickDate: String?
    var isMei: String?
    
    convenience init(ownerName: String, email: String, telephone: String, companyName: String, cnpj: String, activeSince: String, pickDate: String, isMei: String) {
        self.init()
        self.ownerName = ownerName
        self.email = email
        self.telephone = telephone
        self.companyName = companyName
        self.cnpj = cnpj
        self.activeSince = activeSince
        self.pickDate = pickDate
        self.isMei = isMei
    }

}
