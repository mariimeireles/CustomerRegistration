//
//  CustomerDetailViewController.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 3/6/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import UIKit

class CustomerDetailViewController: UIViewController {
    
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var telephoneLabel: UILabel!
    @IBOutlet weak var cnpjLabel: UILabel!
    @IBOutlet weak var activeSinceLabel: UILabel!
    @IBOutlet weak var meiLabel: UILabel!
    var customer: Customer!

    override func viewDidLoad() {
        super.viewDidLoad()
        setLabels()
    }
    
    private func setLabels() {
        self.companyLabel.text = customer.companyName
        self.ownerLabel.text = customer.ownerName
        self.emailLabel.text = customer.email
        self.telephoneLabel.text = customer.telephone
        self.cnpjLabel.text = customer.cnpj
        self.activeSinceLabel.text = customer.activeSince
        if customer.isMei == true {
            self.meiLabel.text = "Yes"
        } else {
            self.meiLabel.text = "No"
        }
    }

}
