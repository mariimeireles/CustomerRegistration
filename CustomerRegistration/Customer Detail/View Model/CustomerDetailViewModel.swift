//
//  CustomerDetailViewModel.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 3/8/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class CustomerDetailViewModel {
    private let bag = DisposeBag()
    var customer: Customer!

    init(customer: Customer!, didPressTelephoneButton: Observable<Void>, didPressEmailButton: Observable<Void>) {
        self.customer = customer
        didPressTelephoneButton
            .subscribe() { event in
                self.didPressTelephoneButton()
        }
            .disposed(by: bag)
        didPressEmailButton
            .subscribe() { event in
                self.didPressEmailButton()
        }
            .disposed(by: bag)
    }
    
    private func didPressTelephoneButton(){
        let phone = customer.telephone
        let formattedPhone = phone?.replacingOccurrences(of: "[ ()-]", with: "", options: [.regularExpression])
        guard let number = URL(string: "tel://" + formattedPhone!) else { return }
        UIApplication.shared.open(number)
    }
    
    private func didPressEmailButton(){
        let email = customer.email
        guard let url = URL(string: "mailto://" + email!) else { return }
        UIApplication.shared.open(url)
    }
}
