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

    init(customer: Customer!, didPressButton: Observable<Void>) {
        self.customer = customer
        didPressButton
            .subscribe() { event in
                self.didPressButton()
        }
            .disposed(by: bag)
    }
    
    private func didPressButton(){
        let phone = customer.telephone
        let formattedPhone = phone?.replacingOccurrences(of: "[ ()-]", with: "", options: [.regularExpression])
        guard let number = URL(string: "tel://" + formattedPhone!) else { return }
        UIApplication.shared.open(number)
    }
}
