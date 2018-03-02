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
    var textFieldCapture: RegistrationCellTextFieldCapture?
    
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
        if let label = textFieldCapture?.validate(text, for: model) {
            if !text.isEmpty {
                self.alertLabel.text = label.text
                self.alertLabel.textColor = label.textColor
            } else {
                self.alertLabel.text = ""
            }
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let fieldType = getFieldType(for: model as! RegistrationTextFieldModel)
        switch fieldType {
        case .phone:
            if let stringText = textField.text {
                if (stringText.count == 0) && string != ""{
                    textField.text = "\(textField.text!)(\(string)"
                    return false
                }
                if (stringText.count == 3) && string != ""{
                    textField.text = "\(textField.text!)) \(string)"
                    return false
                }
                if (stringText.count == 4) && string != ""{
                    textField.text = "\(textField.text!) \(string)"
                    return false
                }
                if (stringText.count == 9) && string != "" {
                    textField.text = "\(textField.text!)-\(string)"
                    return false
                }
                if range.length + range.location > (textField.text?.count)!{
                    return false
                }
                let newLenght = (textField.text?.count)! + string.count - range.length
                return newLenght <= 15
            }
        case .cnpj:
            if let stringText = textField.text {
                if (stringText.count == 2 || stringText.count == 6) && string != ""{
                    textField.text = "\(textField.text!).\(string)"
                    return false
                }
                if (stringText.count == 10) && string != ""{
                    textField.text = "\(textField.text!)/\(string)"
                    return false
                }
                if (stringText.count == 15) && string != "" {
                    textField.text = "\(textField.text!)-\(string)"
                    return false
                }
                if range.length + range.location > (textField.text?.count)!{
                    return false
                }
                let newLenght = (textField.text?.count)! + string.count - range.length
                return newLenght <= 18
            }
        default:
            return true
        }
        return true
    }
    
    private func getFieldType(for model: RegistrationTextFieldModel) -> RegistrationTextFieldType{
        return model.fieldType
    }

    
}
