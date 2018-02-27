//
//  CNPJValidator.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 2/26/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation

class CNPJValidator {
    
    func validate(inputCNPJ: String) -> Bool {
        
        let formattedString = inputCNPJ.replacingOccurrences(of: "[-./]", with: "", options: .regularExpression, range: nil)
        
        let numbers = formattedString.flatMap({Int(String($0))})
        guard numbers.count == 14 && Set(numbers).count != 1 else { return false }
        
        let div1 = makeCount(numbers: numbers, index: 11)
        let div2 = makeCount(numbers: numbers, index: 12)
        
        return div1 == numbers[12] && div2 == numbers[13]
    }
    
    func makeCount(numbers: [Int], index: Int) ->  Int {
        var index = index
        var result = 0
        var multiplier = 2
        repeat {
            result += numbers[index] * multiplier
            index -= 1
            if multiplier == 9 {
                multiplier = 1
            }
            multiplier += 1
        } while index >= 0
        let sum = 11 - (result) % 11
        let div = sum > 9 ? 0 : sum
        return div
    }
    
}
