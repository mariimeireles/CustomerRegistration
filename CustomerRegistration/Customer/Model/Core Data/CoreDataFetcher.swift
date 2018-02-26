//
//  CoreDataFetcher.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 2/23/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation
import CoreData

class CoreDataFetcher {
    
    func fetchUsers() -> [User] {
        var users = [User]()
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        do {
            let fetchedUsers = try PersistenceService.context.fetch(fetchRequest)
            users = fetchedUsers
        } catch let error as NSError {
            print ("Failed to save an user, \(error)")
        }
        return users
    }
    
}
