//
//  Item+CoreDataProperties.swift
//  ToDo-App&Widget
//
//  Created by admin on 9/1/2565 BE.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var completion: Bool
    @NSManaged public var id: UUID?
    @NSManaged public var task: String?
    @NSManaged public var timestamp: Date?

}

extension Item : Identifiable {

}
