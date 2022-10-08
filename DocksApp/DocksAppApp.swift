//
//  DocksAppApp.swift
//  DocksApp
//
//  Created by Daniel Choroszucha on 08/10/2022.
//

import SwiftUI

@main
struct DocksAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
