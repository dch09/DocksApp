//
//  PresetEntity+CoreDataClass.swift
//  DocksApp
//
//  Created by Daniel Choroszucha on 08/10/2022.
//
//

import CoreData
import Foundation

@objc(PresetEntity)
public class PresetEntity: NSManagedObject {
    var name: String {
        get {
            name_ ?? ""
        }
        set {
            name_ = newValue
        }
    }

    var icon: String {
        get {
            icon_ ?? ""
        }
        set {
            icon_ = newValue
        }
    }

    var dateAdded: Date {
        get {
            dateAdded_ ?? .now
        }
        set {
            dateAdded_ = newValue
        }
    }
}

// MARK: Convenience -

extension PresetEntity {
    convenience init(name: String,
                     icon: String,
                     context: NSManagedObjectContext,
                     id: UUID? = nil,
                     dateAdded: Date = .now,
                     isDefault: Bool = false,
                     isFavorite: Bool = false)
    {
        self.init(context: context)
        self.name = name
        self.icon = icon
        self.dateAdded = dateAdded
        self.id = id ?? UUID()
        self.isDefault = isDefault
        self.isFavorite = isFavorite
    }
}

extension PresetEntity {
     static func fetch(predicate: NSPredicate? = nil) -> NSFetchRequest<PresetEntity> {
        let request = NSFetchRequest<PresetEntity>(entityName: "PresetEntity")
        // TODO: Manual sorting? Favorites? -
        request.sortDescriptors = [NSSortDescriptor(keyPath: \PresetEntity.dateAdded, ascending: false)]

        if let predicate {
            request.predicate = predicate
        }
        return request
    }
}

extension PresetEntity {
    static func fetchAll(predicate: NSPredicate? = nil, context: NSManagedObjectContext) throws -> [PresetEntity] {
        try context.fetch(PresetEntity.fetch())
    }

    #if DEBUG
    static func deleteAll(context: NSManagedObjectContext) {
        do {
            let presets = try PresetEntity.fetchAll(context: context)
            presets.forEach(context.delete)
        } catch {
            print(error.localizedDescription)
        }
    }
    #endif
}
