//
//  RetrieveContacts.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 2/21/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation

protocol RetrieveContacts {
    
    func fetchCustomers() -> [Customer]
}
