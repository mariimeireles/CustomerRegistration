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
    private var registrationViewModel: RegistrationViewModel!
    private var inMemoryHeadlines: InMemoryHeadlines!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.inMemoryHeadlines = InMemoryHeadlines()
        self.registrationViewModel = RegistrationViewModel(fetcher: self.inMemoryHeadlines)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
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
            cell = textFieldCell
        case .picker:
            guard let pickerCell = tableView.dequeueReusableCell(withIdentifier: "PickerCell", for: indexPath) as? PickerCell else { return UITableViewCell() }
            pickerCell.model = headlineRow
            cell = pickerCell
        case .switch:
            guard let switchCell = tableView.dequeueReusableCell(withIdentifier: "SwitchCell", for: indexPath) as? SwitchCell else { return UITableViewCell() }
            switchCell.model = headlineRow
            cell = switchCell
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

}
