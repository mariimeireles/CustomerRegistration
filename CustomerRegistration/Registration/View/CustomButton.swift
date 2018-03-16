//
//  CustomButton.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 3/2/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation
import UIKit

class CustomButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.isEnabled = false
    }
    
    override var isEnabled: Bool {
        didSet {
            if self.isEnabled {
                self.alpha = 1
            } else {
                self.alpha = 0.3
            }
        }
    }
    
}
