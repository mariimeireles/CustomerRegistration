//
//  RegistrationTextFieldModel.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 2/28/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation

class RegistrationTextFieldModel: RegistrationCellProtocol {
    
    let fieldType: RegistrationTextFieldType
    let placeholder: String
    
    init(type: RegistrationTextFieldType) {
        self.fieldType = type
        self.placeholder = type.placeholder
    }
    
    var type: RegistrationCellType {
        return .textfield
    }
    
}

