//
//  RegistrationCellTextFieldCapture.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 3/1/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation
import UIKit

protocol RegistrationCellTextFieldCapture: class {
    
    func validate(_ text: String, for type: RegistrationTextFieldModel) -> UILabel
}
