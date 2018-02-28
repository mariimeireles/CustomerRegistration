//
//  RegistrationTextFieldModel.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 2/28/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation
import UIKit

class RegistrationTextFieldModel: RegistrationCellProtocol {
    
    let fieldType: RegistrationTextFieldType
    let placeholder: String
    let keyboardType: UIKeyboardType
    
    init(type: RegistrationTextFieldType) {
        self.fieldType = type
        self.placeholder = type.placeholder
        self.keyboardType = type.keyboardType
    }
    
    var type: RegistrationCellType {
        return .textfield
    }
    
}

