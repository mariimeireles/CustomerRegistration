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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.inMemoryContacts = InMemoryContacts()
        self.customersListViewModel = CustomerListViewModel(fetcher: self.inMemoryContacts)
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
    
    //MARK: TEST
    @IBAction func addCustomerButton(_ sender: Any) {
        saveToCoreData()
    }
    
    //MARK: TEST
    func saveToCoreData(){
        let customer = Customer(ownerName: "Mariana Meireles", email: "mariana.meireles@stone.com.br", telephone: "999952123", companyName: "Stone", cnpj: "85814550000105", activeSince: Date(), isMei: true)
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "User", in: managedContext)
        let user = NSManagedObject(entity: entity!, insertInto: managedContext)
        user.setValue(customer.ownerName, forKey: "ownerName")
        user.setValue(customer.email, forKey: "email")
        user.setValue(customer.telephone, forKey: "telephone")
        user.setValue(customer.companyName, forKey: "companyName")
        user.setValue(customer.cnpj, forKey: "cnpj")
        user.setValue(customer.activeSince, forKey: "activeSince")
        user.setValue(customer.isMei, forKey: "isMei")
        
        do {
            try managedContext.save()
            print ("SAVED USER: \(user)")
        } catch let error as NSError {
            print ("Failed to save an user, \(error)")
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
    
    
}
