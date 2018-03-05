//
//  PersistContact.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 3/2/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation

protocol PersistRegistration: class {
    
    func saveRegistration(customer: Customer)
}
