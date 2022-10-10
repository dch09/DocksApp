//
//  PresetEntity+CoreDataProperties.swift
//  DocksApp
//
//  Created by Daniel Choroszucha on 08/10/2022.
//
//

import CoreData
import Foundation

public extension PresetEntity {
    @nonobjc class func fetchRequest() -> NSFetchRequest<PresetEntity> {
        return NSFetchRequest<PresetEntity>(entityName: "PresetEntity")
    }

    @NSManaged var dateAdded_: Date?
    @NSManaged var isFavorite: Bool
    @NSManaged var isDefault: Bool
    @NSManaged var name_: String?
    @NSManaged var icon_: String?
    @NSManaged var data: Data?
    @NSManaged var id: UUID?
}

extension PresetEntity: Identifiable {}
