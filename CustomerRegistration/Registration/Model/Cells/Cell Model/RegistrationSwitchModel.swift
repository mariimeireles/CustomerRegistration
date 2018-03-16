//
//  RegistrationSwitchModel.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 2/28/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation

class RegistrationSwitchModel: RegistrationCellProtocol {
    
    let label: String
    let switchState: Bool
    
    init(label: String) {
        self.label = label
        self.switchState = false
    }
    
    var type: RegistrationCellType {
        return .switch
    }
}
