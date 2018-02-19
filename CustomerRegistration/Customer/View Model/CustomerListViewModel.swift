//
//  CustomerListViewModel.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 2/19/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation

class CustomerListViewModel {
    
    var customerViewModels: [CustomerViewModel] = [CustomerViewModel]()
    private var localCustomers: LocalCustomers
    var customerListState: CustomerListState!
    
    init(localCustomers: LocalCustomers) {
        self.localCustomers = localCustomers
        populateCustomers()
    }
    
    func populateCustomers() {
        let customers = self.localCustomers.getAllCustomers()
        if customers.isEmpty{
            self.customerListState = CustomerListState(isPopulated: false)
        } else {
            self.customerViewModels = customers.map { customer in
                return CustomerViewModel(customer: customer)
            }
            self.customerListState = CustomerListState(isPopulated: true)
        }
    }
    
}

class CustomerViewModel {
    
    var ownerName: String!
    var companyName: String!
    var companyInitials: String!
    
    init(customer: Customer) {
        self.ownerName = customer.ownerName
        self.companyName = customer.companyName
        self.companyInitials = customer.companyInitials
    }
    
}
