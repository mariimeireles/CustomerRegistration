//
//  TextFieldCell.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 2/27/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import UIKit

class TextFieldCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    
    var model: RegistrationCellProtocol? {
        didSet {
            updateUI()
        }
    }
    
    private func updateUI() {
        textField.delegate = self
        guard let model = model as? RegistrationTextFieldModel else { return }
        setProperties(for: model)
    }
    
    private func setProperties(for model: RegistrationTextFieldModel) {
        DispatchQueue.main.async {
            self.textField.placeholder = model.placeholder
            self.textField.keyboardType = model.keyboardType
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
