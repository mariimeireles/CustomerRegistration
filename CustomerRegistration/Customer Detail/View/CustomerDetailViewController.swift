//
//  CustomerDetailViewController.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 3/6/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CustomerDetailViewController: UIViewController {
    
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var telephoneButton: UIButton!
    @IBOutlet weak var cnpjLabel: UILabel!
    @IBOutlet weak var activeSinceLabel: UILabel!
    @IBOutlet weak var meiLabel: UILabel!
    var customer: Customer!
    private var viewModel: CustomerDetailViewModel!
    private let bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CustomerDetailViewModel(customer: self.customer, didPressButton: telephoneButton.rx.tap.asObservable())

        setLabels()
    }
    
    private func setLabels() {
        self.companyLabel.text = customer.companyName
        self.ownerLabel.text = customer.ownerName
        self.emailLabel.text = customer.email
        self.telephoneButton.setTitle(customer.telephone, for: .normal)
        self.cnpjLabel.text = customer.cnpj
        self.activeSinceLabel.text = customer.activeSince
        if customer.isMei == true {
            self.meiLabel.text = "Yes"
        } else {
            self.meiLabel.text = "No"
        }
    }

}