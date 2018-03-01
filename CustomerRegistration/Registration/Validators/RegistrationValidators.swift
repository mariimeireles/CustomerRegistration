//
//  RegistrationValidators.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 3/1/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation

class RegistrationValidators {
    
    let nameValidator: NameValidator
    let emailValidator: EmailValidator
    let phoneValidator: PhoneValidator
    let companyNameValidator: CompanyNameValidator
    let cnpjValidator: CNPJValidator
    
    init(name: NameValidator, email: EmailValidator, phone: PhoneValidator, companyName: CompanyNameValidator, cnpj: CNPJValidator) {
        self.nameValidator = name
        self.emailValidator = email
        self.phoneValidator = phone
        self.companyNameValidator = companyName
        self.cnpjValidator = cnpj
    }
}
