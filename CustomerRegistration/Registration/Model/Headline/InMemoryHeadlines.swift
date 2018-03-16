//
//  InMemoryHeadlines.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 2/26/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation

class InMemoryHeadlines: RetrieveHeadlines {
    
    func fetchHeadlines() -> [RegistrationCellProtocol] {
        return [
            RegistrationTextFieldModel(type: .ownerName("Owner Name")),
            RegistrationTextFieldModel(type: .email("Email")),
            RegistrationTextFieldModel(type: .phone("Phone for contact")),
            RegistrationTextFieldModel(type: .companyName("Company Name")),
            RegistrationTextFieldModel(type: .cnpj("CNPJ")),
            RegistrationPickerModel(label: "Active since", placeholder: "choose"),
            RegistrationSwitchModel(label: "Is MEI?")
        ]
    }
}


