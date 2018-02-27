//
//  NameValidator.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 2/26/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation

class NameValidator {
    
    func validate(inputName: String) -> Bool {
        
        let formattedString = inputName.replacingOccurrences(of: " ", with: "")
        if formattedString.count < 4 || formattedString.count > 60 {
            return false
        }
        
        if inputName.hasSuffix(" ") || inputName.hasPrefix(" ") {
            return false
        }
        
        return true
    }
    
}
