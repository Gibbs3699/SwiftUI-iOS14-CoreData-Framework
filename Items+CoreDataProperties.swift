//
//  Items+CoreDataProperties.swift
//  ToDo-App&Widget
//
//  Created by admin on 8/1/2565 BE.
//
//

import Foundation
import CoreData


extension Items {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Items> {
        return NSFetchRequest<Items>(entityName: "Items")
    }

    @NSManaged public var timestamp: Date?
    @NSManaged public var task: String?

}

extension Items : Identifiable {

}
