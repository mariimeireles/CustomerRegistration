//
//  PhoneValidator.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 2/26/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation

class PhoneValidator {
    
    let ddds = ["11", "12", "13", "14", "15", "16", "17", "18", "19", "21", "22", "24", "27", "28", "31", "32", "33", "34", "35", "37", "38", "41", "42", "43", "44", "45", "46", "47", "48", "49", "51", "53", "54", "55", "61", "62", "63", "64", "65", "66", "67", "68", "69", "71", "73", "74", "75", "77", "79", "81", "82", "83", "84", "85", "86", "87", "88", "89", "91", "92", "93", "94", "95", "96", "97", "98", "99"]
    
    func validate(inputNumber: String) -> Bool {
        
        let formattedString = inputNumber.replacingOccurrences(of: "[ ()-]", with: "", options: [.regularExpression])
        if formattedString.count < 10 || formattedString.count > 11 {
            return false
        }

        let firstCharacter = formattedString.index(formattedString.startIndex, offsetBy: 0)
        let secondCharacter = formattedString.index(formattedString.startIndex, offsetBy: 1)
        let dddString = formattedString[(firstCharacter ... secondCharacter)]
        
        if !ddds.contains(String(dddString)) {
            return false
        }
        
        return true
    }
    
}
