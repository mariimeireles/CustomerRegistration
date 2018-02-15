//
//  ClientModel.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles on 14/02/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation

struct ClientModel {
    
    let company: String
    let owner: String
    var ownerInitials: String
    
    init(company: String, owner: String) {
        self.company = company
        self.owner = owner
        self.ownerInitials = ""
        let inicials = generateThreeInicials(name: owner)
        self.ownerInitials = inicials
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
