//
//  Client+CoreDataProperties.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 3/1/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//
//

import Foundation
import CoreData


extension Client {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Client> {
        return NSFetchRequest<Client>(entityName: "Client")
    }

    @NSManaged public var ownerName: String?
    @NSManaged public var email: String?
    @NSManaged public var telephone: String?
    @NSManaged public var companyName: String?
    @NSManaged public var cnpj: String?
    @NSManaged public var activeSince: String?
    @NSManaged public var isMei: Bool
    
    convenience init (translatedClient: CustomerTranslater) {
        self.init()
        self.ownerName = translatedClient.ownerName
        self.email = translatedClient.email
        self.telephone = translatedClient.telephone
        self.companyName = translatedClient.companyName
        self.cnpj = translatedClient.cnpj
        self.activeSince = translatedClient.activeSince
        self.isMei = translatedClient.isMei
    }

}
