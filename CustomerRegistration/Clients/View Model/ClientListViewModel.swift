//
//  ClientListViewModel.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 2/19/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation

class ClientListViewModel {
    
    var clientViewModels: [ClientViewModel] = [ClientViewModel]()
    private var localClients: LocalClients
    
    init(localClients: LocalClients) {
        self.localClients = localClients
        populateClients()
    }
    
    func populateClients() {
        let clients = self.localClients.getAllClients()
        self.clientViewModels = clients.map { client in
            return ClientViewModel(client: client)
        }
        
    }
    
}

class ClientViewModel {
    
    var ownerName: String!
    var companyName: String!
    var companyInitials: String!
    
    init(client: Client) {
        self.ownerName = client.ownerName
        self.companyName = client.companyName
        self.companyInitials = client.companyInitials
    }
    
}
