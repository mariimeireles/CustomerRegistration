//
//  LocalCustomers.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 2/19/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation

class InMemoryContacts: RetrieveContacts {
    
    func fetchCustomers() -> [User] {
        var users = [User]()
        let user = User(context: PersistenceService.context)
        user.ownerName = "Mariana Meireles"
        user.email = "mariana.meireles@stone.com.br"
        user.telephone = "999952123"
        user.companyName = "Stone"
        user.cnpj = "85814550000105"
        user.activeSince = Date() as NSDate
        user.isMei = true
        users.append(user)
        
        return users
    }
    
}
