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
    
    func fetchCustomers() -> [User] {
        var users = [User]()
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        do {
            let user = try PersistenceService.context.fetch(fetchRequest)
            users = user
        } catch let error as NSError {
            print ("Failed to save an user, \(error)")
        }
        
        return users
    }
    
}
