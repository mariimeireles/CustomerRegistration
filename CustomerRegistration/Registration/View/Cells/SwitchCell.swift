//
//  SwitchCell.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 2/28/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import UIKit

class SwitchCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var `switch`: UISwitch!
    var switchCapture: RegistrationCellSwitchCapture?
    
    var model: RegistrationCellProtocol? {
        didSet {
            updateUI()
        }
    }
    
    private func updateUI() {
        guard let model = model as? RegistrationSwitchModel else { return }
        setProperties(for: model)
        switchCapture?.isMeiChanged(to: model.switchState)
    }
    
    private func setProperties(for model: RegistrationSwitchModel) {
        DispatchQueue.main.async {
            self.label.text = model.label
            self.switch.isOn = model.switchState
        }
    }
    
    @IBAction func valueChanged(_ sender: UISwitch) {
        switchCapture?.isMeiChanged(to: sender.isOn)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
