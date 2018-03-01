//
//  RegistrationViewModel.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 2/27/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation
import UIKit

class RegistrationViewModel {
    
    var registrationHeadline: [RegistrationCellProtocol]!
    private let headlinesFetcher: RetrieveHeadlines
    private let validators: RegistrationValidators
    
    init(fetcher: RetrieveHeadlines, validators: RegistrationValidators) {
        self.headlinesFetcher = fetcher
        self.validators = validators
        self.registrationHeadline = populateHeadline()

    }
    
    func populateHeadline() -> [RegistrationCellProtocol] {
        return self.headlinesFetcher.fetchHeadlines()
    }
    
}

extension RegistrationViewModel: RegistrationCellFieldCapture {
    
    func validate(_ text: String, for type: RegistrationTextFieldModel) -> UILabel {
        
        var quote: UILabel!
        
        switch type.fieldType {
        case .ownerName:
            let result = validators.nameValidator.validate(inputName: text)
            quote = alertMessage(field: "name", result: result)
        //            registrationValidator.name = (field: text, isValid: result)
        case .email:
            let result = validators.emailValidator.validate(inputEmail: text)
            quote = alertMessage(field: "email", result: result)
        //            registrationValidator.email = (field: text, isValid: result)
        case .phone:
            let result = validators.phoneValidator.validate(inputNumber: text)
            quote = alertMessage(field: "phone ", result: result)
        //            registrationValidator.phone = (field: text, isValid: result)
        case .companyName:
            let result = validators.companyNameValidator.validate(inputCompany: text)
            quote = alertMessage(field: "name", result: result)
        //            registrationValidator.companyName = (field: text, isValid: result)
        case .cnpj:
            let result = validators.cnpjValidator.validate(inputCNPJ: text)
            quote = alertMessage(field: "cnpj", result: result)
            //            registrationValidator.cnpj = (field: text, isValid: result)
        }
        
        //        verifyRegistrationStatus()
        
        return quote
    }
    
    func alertMessage(field: String, result: Bool) -> UILabel{
        
        let alertLabel = UILabel()
        
        if result == true {
            alertLabel.text = "valid \(field) :)"
            alertLabel.textColor = UIColor(red:0.07, green:0.46, blue:0.25, alpha:1.0)
        } else {
            alertLabel.text = "invalid \(field) :("
            alertLabel.textColor = .red
        }
        return alertLabel
    }
}


