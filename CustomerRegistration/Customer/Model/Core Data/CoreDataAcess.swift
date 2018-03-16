//
//  CoreDataAcess.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 2/23/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation
import CoreData

class CoreDataAcess {

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
    
    func fetchSpecificClient(email: String) -> Client {
        var client: Client!
        let fetchRequest: NSFetchRequest<Client> = Client.fetchRequest()
        do {
            let fetchedClients = try PersistenceService.context.fetch(fetchRequest)
            for fetchedClient in fetchedClients {
                if fetchedClient.email == email {
                    client = fetchedClient
                }
            }
        } catch let error as NSError {
            print ("Failed to fetch client, \(error)")
        }
        return client
    }
    
    func deleteClients(customer: Customer) {
        let customerEmail = customer.email
        let clientToBeDeleted = self.fetchSpecificClient(email: customerEmail!)
        PersistenceService.context.delete(clientToBeDeleted)
        PersistenceService.saveContext()
    }
}

