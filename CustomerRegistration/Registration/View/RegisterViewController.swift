//
//  RegisterViewController.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 2/19/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var createButton: CustomButton!
    private var registrationViewModel: RegistrationViewModel!
    private var inMemoryHeadlines: InMemoryHeadlines!
    private let nameValidator = NameValidator()
    private let emailValidator = EmailValidator()
    private let phoneValidator = PhoneValidator()
    private let companyNameValidator = CompanyNameValidator()
    private let cnpjValidator = CNPJValidator()
    private let dataModel = DataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setValidators()
        setCallbackForUpdateButtonState()
        DispatchQueue.main.async {
            self.tableView.allowsSelection = false
            self.tableView.reloadData()
        }
    }
    
    private func setValidators() {
        self.inMemoryHeadlines = InMemoryHeadlines()
        let validators = TextFieldValidators(name: self.nameValidator, email: self.emailValidator, phone: self.phoneValidator, companyName: self.companyNameValidator, cnpj: self.cnpjValidator)
        self.registrationViewModel = RegistrationViewModel(fetcher: self.inMemoryHeadlines, validators: validators)
    }
    
    private func setCallbackForUpdateButtonState() {
        registrationViewModel.didUpdateButtonState = { [weak self] isEnabled in
            self?.setButton(to: isEnabled)
        }
    }
    
    private func setButton(to isEnabled: Bool) {
        DispatchQueue.main.async {
            self.createButton.isEnabled = isEnabled
        }
    }
    
    @IBAction func createButton(_ sender: Any) {
        dataModel.persistRegistration = registrationViewModel
        let customer = registrationViewModel.registrationValidator.customer
        dataModel.requestData(customer: customer)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return registrationViewModel.registrationHeadline.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        let headlineRow = self.registrationViewModel.registrationHeadline[indexPath.row]
        
        switch headlineRow.type {
        case .textfield:
            guard let textFieldCell = tableView.dequeueReusableCell(withIdentifier: "TextFieldCell", for: indexPath) as? TextFieldCell else { return UITableViewCell() }
            textFieldCell.model = headlineRow
            textFieldCell.textFieldCapture = registrationViewModel
            cell = textFieldCell
        case .picker:
            guard let pickerCell = tableView.dequeueReusableCell(withIdentifier: "PickerCell", for: indexPath) as? PickerCell else { return UITableViewCell() }
            pickerCell.model = headlineRow
            pickerCell.dateCapture = registrationViewModel
            cell = pickerCell
        case .switch:
            guard let switchCell = tableView.dequeueReusableCell(withIdentifier: "SwitchCell", for: indexPath) as? SwitchCell else { return UITableViewCell() }
            switchCell.model = headlineRow
            switchCell.switchCapture = registrationViewModel
            cell = switchCell
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }

}
