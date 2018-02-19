//
//  ClientListViewController.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 2/19/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import UIKit

class ClientListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    private var clientsListViewModel: ClientListViewModel!
    private var localClients: LocalClients!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.localClients = LocalClients()
        self.clientsListViewModel = ClientListViewModel(localClients: self.localClients)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.clientsListViewModel.clientViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Client") as? ClientCell else { return UITableViewCell() }
        let clientViewModel = self.clientsListViewModel.clientViewModels[indexPath.row]
        
        if let ownerText = clientViewModel.ownerName {
            cell.ownerNameLabel.text = ownerText
        }else{
            cell.ownerNameLabel.text = "-"
        }
        if let companyText = clientViewModel.companyName {
            cell.companyNameLabel.text = companyText
        }else{
            cell.companyNameLabel.text = "-"
        }
        if let initialsText = clientViewModel.companyInitials {
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
