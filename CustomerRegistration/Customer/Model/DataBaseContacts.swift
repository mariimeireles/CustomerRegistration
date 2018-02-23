//
//  DataBaseContacts.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 2/21/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation
import CoreData

class DataBaseContacts: RetrieveContacts {
    
    let coreDataFetcher = CoreDataFetcher()
    
    func fetchCustomers() -> [Customer] {
        var customers = [Customer]()
        let users = coreDataFetcher.fetchUsers()
        for user in users {
            let fetchedUser = UserTranslater(managedCustomer: user)
            customers.append(Customer(translatedCustomer: fetchedUser))
        }
        return customers
    }
    
}
