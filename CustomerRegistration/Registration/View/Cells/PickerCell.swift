//
//  PickerCell.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 2/28/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import UIKit

class PickerCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var model: RegistrationCellProtocol? {
        didSet {
            updateUI()
        }
    }
    
    private func updateUI() {
        guard let model = model as? RegistrationPickerModel else { return }
        DispatchQueue.main.async {
            self.label.text = model.label
            self.textField.placeholder = model.placeholder
            
            let datePicker = UIDatePicker()
            datePicker.datePickerMode = UIDatePickerMode.date
            datePicker.addTarget(self, action: #selector(PickerCell.datePickerValueChanged(sender:)), for: UIControlEvents.valueChanged)
            self.textField.inputView = datePicker
        }
    }
    
    @objc private func datePickerValueChanged(sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.medium
        formatter.timeStyle = DateFormatter.Style.none
        self.textField.text = formatter.string(from: sender.date)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
