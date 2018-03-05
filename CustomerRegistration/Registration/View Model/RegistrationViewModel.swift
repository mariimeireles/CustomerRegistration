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
    private let textFieldValidators: TextFieldValidators
    let registrationValidator = RegistrationValidator()
    private(set) var registrationState: RegistrationState = .invalid {
        didSet {
            callUpdateButtonWhenStateChange(oldValue)
        }
    }
    var didUpdateButtonState: ((Bool) -> Void)?
//    var persistRegistration: PersistRegistration?

    
    init(fetcher: RetrieveHeadlines, validators: TextFieldValidators) {
        self.headlinesFetcher = fetcher
        self.textFieldValidators = validators
        self.registrationHeadline = populateHeadline()
    }
    
    func populateHeadline() -> [RegistrationCellProtocol] {
        return self.headlinesFetcher.fetchHeadlines()
    }
    
    private func verifyRegistrationState() {
        let isAllFieldsValid = registrationValidator.isAllFieldsValid
        let registrationState = RegistrationState(isValid: isAllFieldsValid)
        self.registrationState = registrationState
    }
    
    private func callUpdateButtonWhenStateChange(_ oldState: RegistrationState) {
        if oldState != registrationState {
            didUpdateButtonState?(registrationState.isValid)
        }
    }
    
}

extension RegistrationViewModel {
    
    class RegistrationValidator {
        typealias Property = (field: String, isValid: Bool)
        
        var ownerName: Property = (field: "", isValid: false)
        var email: Property = (field: "", isValid: false)
        var phone: Property = (field: "", isValid: false)
        var companyName: Property = (field: "", isValid: false)
        var cnpj: Property = (field: "", isValid: false)
        var activeSince: Property = (field: "", isValid: false)
        var isMei: Bool = false
        
        var isAllFieldsValid: Bool {
            return
                self.ownerName.isValid &&
                self.email.isValid &&
                self.phone.isValid &&
                self.companyName.isValid &&
                self.cnpj.isValid &&
                self.activeSince.isValid
        }
        
        var customer: Customer {
            return Customer(ownerName: self.ownerName.field, email: self.email.field, telephone: self.phone.field, companyName: self.companyName.field, cnpj: self.cnpj.field, activeSince: self.activeSince.field, isMei: self.isMei)
        }
    }
}

extension RegistrationViewModel: RegistrationCellTextFieldCapture {
    
    func validate(_ text: String, for type: RegistrationTextFieldModel) -> UILabel {
        
        var quote: UILabel!
        
        switch type.fieldType {
        case .ownerName:
            let result = textFieldValidators.nameValidator.validate(inputName: text)
            quote = alertMessage(field: "name", result: result)
            registrationValidator.ownerName = (field: text, isValid: result)
        case .email:
            let result = textFieldValidators.emailValidator.validate(inputEmail: text)
            quote = alertMessage(field: "email", result: result)
            registrationValidator.email = (field: text, isValid: result)
        case .phone:
            let result = textFieldValidators.phoneValidator.validate(inputNumber: text)
            quote = alertMessage(field: "phone ", result: result)
            registrationValidator.phone = (field: text, isValid: result)
        case .companyName:
            let result = textFieldValidators.companyNameValidator.validate(inputCompany: text)
            quote = alertMessage(field: "name", result: result)
            registrationValidator.companyName = (field: text, isValid: result)
        case .cnpj:
            let result = textFieldValidators.cnpjValidator.validate(inputCNPJ: text)
            quote = alertMessage(field: "cnpj", result: result)
            registrationValidator.cnpj = (field: text, isValid: result)
        }
        
        verifyRegistrationState()
        return quote
    }
    
    private func alertMessage(field: String, result: Bool) -> UILabel{
        
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

extension RegistrationViewModel: RegistrationCellDateCapture {
    
    func validate(_ text: String) -> Bool {
        
        var result = false
        
        if !text.isEmpty {
            result = true
        }
        registrationValidator.activeSince = (field: text, isValid: result)
        verifyRegistrationState()
        return result
    }
    
}

extension RegistrationViewModel: RegistrationCellSwitchCapture {
    
    func isMeiChanged(to status: Bool) {
        registrationValidator.isMei = status
        verifyRegistrationState()
    }
    
}

extension RegistrationViewModel: PersistRegistration {

    func saveRegistration(customer: Customer) {
        let client = Client(context: PersistenceService.context)
        client.ownerName = customer.ownerName!
        client.email = customer.email!
        client.telephone = customer.telephone!
        client.companyName = customer.companyName!
        client.cnpj = customer.cnpj!
        client.activeSince = customer.activeSince!
        client.isMei = customer.isMei!
        PersistenceService.saveContext()
    }
}

class DataModel {
    weak var persistRegistration: PersistRegistration?
    var registrationViewModel: RegistrationViewModel!
    func requestData(customer: Customer) {
        persistRegistration?.saveRegistration(customer: customer)
    }
}



