//
//  CustomerListViewModel.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 2/19/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation

class CustomerListViewModel {
    
    var customerRows: [CustomerRow] = [CustomerRow]()
    var customers: [Customer] = [Customer]()
    private var customersFetcher: RetrieveContacts!
    var customerListState: CustomerListState!
    
    init(fetcher: RetrieveContacts) {
        self.customersFetcher = fetcher
        customerRows = populateRows()!
    }
    
    func populateRows() -> [CustomerRow]? {
        let customers = self.customersFetcher.fetchCustomers()
        var customerRow = [CustomerRow]()
        if customers.isEmpty{
            self.customerListState = CustomerListState(isPopulated: false)
        } else {
            customerRow = customers.map { customer in
                self.customers.append(customer)
                return CustomerRow(customer: customer)
            }
            self.customerListState = CustomerListState(isPopulated: true)
        }
        return customerRow
    }
    
}

class CustomerRow {
    
    var ownerName: String!
    var companyName: String!
    var companyInitials: String?
    
    init(customer: Customer) {
        self.ownerName = customer.ownerName
        self.companyName = customer.companyName
        let inicials = generateThreeInicials(name: companyName)
        self.companyInitials = inicials
    }
    
    func generateThreeInicials(name: String) -> String {
        let inicials = name.components(separatedBy: " ").reduce("") { $0 + $1.first }
        let threeInicials = inicials.prefix(3)
        return String(threeInicials)
    }
    
}

extension String {
    public var first: String {
        return String(self[startIndex])
    }
}
