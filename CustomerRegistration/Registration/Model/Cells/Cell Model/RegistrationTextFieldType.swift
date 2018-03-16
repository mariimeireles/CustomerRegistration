//
//  RegistrationFieldType.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 2/28/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation
import UIKit

enum RegistrationTextFieldType {
    
    case ownerName(String)
    case email(String)
    case phone(String)
    case companyName(String)
    case cnpj(String)
    
    var placeholder: String {
        switch self {
        case let .ownerName(placeholder):
            return placeholder
        case let .email(placeholder):
            return placeholder
        case let .phone(placeholder):
            return placeholder
        case let .companyName(placeholder):
            return placeholder
        case let .cnpj(placeholder):
            return placeholder
        }
    }
    
    var keyboardType: UIKeyboardType {
        switch self {
        case .ownerName:
            return .default
        case .email:
            return .emailAddress
        case .phone:
            return .numberPad
        case .companyName:
            return .default
        case .cnpj:
            return .numberPad
        }
    }
}
