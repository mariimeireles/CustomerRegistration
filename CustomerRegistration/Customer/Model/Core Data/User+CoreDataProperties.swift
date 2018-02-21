//
//  User+CoreDataProperties.swift
//  CustomerRegistration
//
//  Created by Mariana Meireles | Stone on 2/21/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var activeSince: NSDate?
    @NSManaged public var cnpj: String?
    @NSManaged public var companyName: String?
    @NSManaged public var email: String?
    @NSManaged public var isMei: Bool
    @NSManaged public var ownerName: String?
    @NSManaged public var telephone: String?

}
