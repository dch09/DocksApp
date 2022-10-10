//
//  RootViewModel.swift
//  DocksApp
//
//  Created by Daniel Choroszucha on 08/10/2022.
//

import CoreData
import Foundation

class RootViewModel: ObservableObject {
    @Published private(set) var presets: [PresetEntity] = []
    private var context: NSManagedObjectContext?

    init() {
        dockPrefLocation()
    }

    func setup(with context: NSManagedObjectContext) {
        self.context = context
    }

    func activate(preset: PresetEntity) {
        //
    }

    private func fetchPresets() {
        guard let context else { return }

        do {
            self.presets = try PresetEntity.fetchAll(context: context)
        } catch {
            print(error.localizedDescription)
        }
    }
}

import AppKit
extension RootViewModel {
    private func dockPrefLocation() {
        let fm = FileManager.default
        let filePath = "/Users/$(whoami)/Library/Preferences/com.apple.dock.plist"
        let homeDirURL = fm.homeDirectoryForCurrentUser
        let prefDirURL = homeDirURL.appending(component: "Library").appending(component: "Preferences")
        let dockFileURL = prefDirURL.appending(component: "com.apple.dock.plist")
        let desktopURL = homeDirURL.appending(component: "TEST")
        // print(homeDirURL)
        do {
            try fm.copyItem(at: dockFileURL, to: desktopURL.appending(component: "com.apple.dock.plist"))
        } catch {
            print(error.localizedDescription)
        }
    }

    func saveCurrent() {
        let fm = FileManager.default
        let tmpPath = fm.temporaryDirectory.appending(component: UUID().uuidString)
    }
}
