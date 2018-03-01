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
    @IBOutlet weak var alertLabel: UILabel!
    var fieldCapture: RegistrationCellFieldCapture?
    
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
            self.textField.addTarget(self, action: #selector(self.editingChanged), for: .editingChanged)
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
    
    @objc func editingChanged(_ textField: UITextField) {
        
        if textField.text?.count == 1 {
            if textField.text?.first == " " {
                textField.text = ""
                return
            }
        }
        
        let text = textField.text ?? ""
        setAlertLabel(text)
    }
    
    
    private func setAlertLabel(_ text: String) {
        guard let model = model as? RegistrationTextFieldModel else { return }
        if let label = fieldCapture?.validate(text, for: model){
            if !text.isEmpty {
                self.alertLabel.text = label.text
                self.alertLabel.textColor = label.textColor
            } else {
                self.alertLabel.text = ""
            }
        }
    }

    
}
