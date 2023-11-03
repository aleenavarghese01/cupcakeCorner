//
//  Entity+CoreDataProperties.swift
//  cupcakeCorner
//
//  Created by Aleena Varghese on 03/11/23.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

    @NSManaged public var extraFrosting: Bool
    @NSManaged public var streetAddress: String?
    @NSManaged public var name: String?
    @NSManaged public var addSprinkles: Bool
    @NSManaged public var city: String?
    @NSManaged public var zip: String?
    @NSManaged public var itemName: String?
    @NSManaged public var didAddFrosting: String?
    @NSManaged public var didExtraFrosting: String?

}

extension Entity : Identifiable {

}
