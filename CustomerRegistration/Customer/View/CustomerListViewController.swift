//
//  CustomerListViewController.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 2/19/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import UIKit
import CoreData

class CustomerListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    private var customersListViewModel: CustomerListViewModel!
    private var inMemoryContacts: InMemoryContacts!
    private var dataBaseContacts: DataBaseContacts!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.inMemoryContacts = InMemoryContacts()
        self.dataBaseContacts = DataBaseContacts()
        self.customersListViewModel = CustomerListViewModel(fetcher: self.dataBaseContacts)
        customerState()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    private func customerState(){
        let customerListState: CustomerListState = self.customersListViewModel.customerListState
        switch customerListState {
        case .empty:
            self.tableView.alpha = 0
        case .populated:
            self.warningLabel.alpha = 0
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.customersListViewModel.customerRows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Customer") as? CustomerCell else { return UITableViewCell() }
        let customerRow = self.customersListViewModel.customerRows[indexPath.row]
        
        if let ownerText = customerRow.ownerName {
            cell.ownerNameLabel.text = ownerText
        }else{
            cell.ownerNameLabel.text = "-"
        }
        if let companyText = customerRow.companyName {
            cell.companyNameLabel.text = companyText
        }else{
            cell.companyNameLabel.text = "-"
        }
        if let initialsText = customerRow.companyInitials {
            cell.initialsLabel.text = initialsText
        }else{
            cell.initialsLabel.text = "-"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    @IBAction func unwindFromRegistration(segue: UIStoryboardSegue) { }
    
    
}
