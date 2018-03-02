//
//  RegistrationState.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 3/2/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation

enum RegistrationState {
    
    case valid
    case invalid
    
    init(isValid: Bool) {
        if isValid {
            self = .valid
        } else {
            self = .invalid
        }
    }
    
    var isValid: Bool {
        switch self {
        case .valid:
            return true
        case .invalid:
            return false
        }
    }
    
}
