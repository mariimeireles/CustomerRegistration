//
//  RegistrationPickerModel.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 2/28/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation

class RegistrationPickerModel: RegistrationCellProtocol {
    
    let label: String
    let placeholder: String
    
    init(label: String, placeholder: String) {
        self.label = label
        self.placeholder = placeholder
    }
    
    var type: RegistrationCellType {
        return .picker
    }
    
}
