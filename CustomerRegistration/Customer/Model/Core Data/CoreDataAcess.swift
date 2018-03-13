//
//  CoreDataAcess.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 2/23/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation
import CoreData
import RxSwift

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
    
    func deleteClients(customer: Customer) {
//        let clientToBeDeleted = CustomerTranslater(customer: customer)
        let client = Client(context: PersistenceService.context)
        client.ownerName = customer.ownerName
        client.cnpj = customer.cnpj
        client.activeSince = customer.activeSince
        client.companyName = customer.companyName
        client.telephone = customer.telephone
        client.email = customer.email
        client.isMei = customer.isMei!
        print("CLIENT\(client)")
        print("CLIENT EMAIL \(client.email)")
        PersistenceService.context.delete(client)
        do {
            try PersistenceService.context.save()
            print("SAAAAAVE")
        } catch let error as NSError {
            print ("Failed to save an client, \(error)")
        }
    }
    
}

