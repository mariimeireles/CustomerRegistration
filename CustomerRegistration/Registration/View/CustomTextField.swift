//
//  CustomTextField.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 2/28/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {

    override func caretRect(for position: UITextPosition) -> CGRect {
        return CGRect.zero
    }

}
