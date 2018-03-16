//
//  CustomerListState.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 2/19/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation

enum CustomerListState {
    
    case empty
    case populated
    
    init(isPopulated: Bool) {
        if isPopulated {
            self = .populated
        } else {
            self = .empty
        }
    }
    
}
