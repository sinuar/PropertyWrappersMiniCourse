//
//  Item.swift
//  CoreDataFetchExample
//
//  Created by Sinuhe Alvarez Ruedas on 13/11/25.
//

import Foundation
import CoreData

@objc(Item)
public class Item: NSManagedObject {}

extension Item {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var timestamp: Date?
    @NSManaged public var title: String?
}

extension Item: Identifiable {}

