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
    
    func fetchClients() -> [Client] {
        var clients = [Client]()
        let fetchRequest: NSFetchRequest<Client> = Client.fetchRequest()
        do {
            let fetchedClients = try PersistenceService.context.fetch(fetchRequest)
            clients = fetchedClients
        } catch let error as NSError {
            print ("Failed to save an client, \(error)")
        }
        return clients
    }
    
}
