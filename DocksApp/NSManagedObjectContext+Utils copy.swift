//
//  NSManagedObject+Utils.swift
//  DocksApp
//
//  Created by Daniel Choroszucha on 08/10/2022.
//

import CoreData
import Foundation

extension NSManagedObjectContext {
    func applyChanges() {
        // #if DEBUG
//         let shouldSaveData = UserDefaults.standard.bool(forKey: "debug-saveCoreDataEnabled")
//         guard shouldSaveData == true else { return }
        // #endif
        guard hasChanges else { return }
        do {
            try save()
            print("Saved core data")
        } catch {
            print(error.localizedDescription)
        }
    }
}
