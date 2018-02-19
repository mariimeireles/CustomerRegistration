//
//  ClientModel.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles on 14/02/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation

struct Client {
    
    var ownerName: String
    var email: String
    var telephone: String
    var companyName: String
    var companyInitials: String?
    var CNPJ: String
//    var activeSince: Date
    var isMei: Bool
    
    init(ownerName: String, email: String, telephone: String, companyName: String, CNPJ: String, isMei: Bool) {
        self.ownerName = ownerName
        self.email = email
        self.telephone = telephone
        self.companyName = companyName
        self.CNPJ = CNPJ
//        self.activeSince = activeSince
        self.isMei = isMei
        let inicials = generateThreeInicials(name: companyName)
        self.companyInitials = inicials
    }
    
//    init(viewModel: ClientViewModel){
//        self.companyName = viewModel.companyName
//        self.ownerName = viewModel.ownerName
//        let inicials = generateThreeInicials(name: companyName)
//        self.companyInitials = inicials
//    }
    
    private func generateThreeInicials(name: String) -> String {
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
