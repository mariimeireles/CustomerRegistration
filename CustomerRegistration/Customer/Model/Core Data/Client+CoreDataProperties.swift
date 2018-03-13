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
    
//    convenience init (translatedClient: CustomerTranslater) {
//        self.init()
//        self.ownerName = self.value(forKeyPath: translatedClient.ownerName) as? String
//        //client.value(forKey: "ownerName") as? String
////        self.email = translatedClient.client.value(forKey: "email") as? String
////        self.telephone = translatedClient.client.value(forKey: "telephone") as? String
////        self.companyName = translatedClient.client.value(forKey: "companyName") as? String
////        self.cnpj = translatedClient.client.value(forKey: "cnpj") as? String
////        self.activeSince = translatedClient.client.value(forKey: "activeSince") as? String
////        self.isMei = translatedClient.client.value(forKey: "activeSince") as! Bool
//    }

}
