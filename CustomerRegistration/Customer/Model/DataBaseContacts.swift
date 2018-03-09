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
    
    let coreDataAcess = CoreDataAcess()
    
    func fetchCustomers() -> [Customer] {
        var customers = [Customer]()
        let clients = coreDataAcess.fetchClients()
        for client in clients {
            let fetchedClient = ClientTranslater(managedCustomer: client)
            customers.append(Customer(translatedCustomer: fetchedClient))
        }
        return customers
    }
    
}
