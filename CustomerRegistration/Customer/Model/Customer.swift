//
//  CustomerModel.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles on 14/02/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation
import CoreData

class Customer: NSManagedObject {
    
    var ownerName: String?
    var email: String?
    var telephone: String?
    var companyName: String?
    var cnpj: String?
    var activeSince: Date?
    var isMei: Bool?
    
    convenience init(ownerName: String, email: String, telephone: String, companyName: String, cnpj: String, activeSince: Date, isMei: Bool) {
        self.init()
        self.ownerName = ownerName
        self.email = email
        self.telephone = telephone
        self.companyName = companyName
        self.cnpj = cnpj
        self.activeSince = activeSince
        self.isMei = isMei
    }
    
}
