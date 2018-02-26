//
//  CompanyNameValidator.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 2/26/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation

class CompanyNameValidator {
    
    func validate(inputCompany: String) -> Bool {
        
        let formattedString = inputCompany.replacingOccurrences(of: " ", with: "")
        if formattedString.count < 2 || formattedString.count > 60 {
            return false
        }

        if inputCompany.hasSuffix(" ") || inputCompany.hasPrefix(" ") {
            return false
        }

        return true
    }
    
}
