//
//  DocksAppApp.swift
//  DocksApp
//
//  Created by Daniel Choroszucha on 08/10/2022.
//

import SwiftUI

enum AppWindow: String, Identifiable, Codable, Hashable {
    var id: String { rawValue }

    case onboarding
    case settings
}

@main
struct DocksAppApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject private var rootViewModel = RootViewModel()
    @Environment(\.openWindow) var openWindow

    var body: some Scene {
        WindowGroup("Window", for: AppWindow.self) {
            Window(type: $0)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        MenuBarExtra("Docks", systemImage: "dock.rectangle") {
            ForEach(rootViewModel.presets) { preset in
                Button {
                    rootViewModel.activate(preset: preset)
                } label: {
                    Label(preset.name, systemImage: preset.icon)
                }
            }
            Divider()
            Button("Save Current") {
                rootViewModel.saveCurrent()
            }
            .keyboardShortcut("S", modifiers: [.command])
            Divider()
            Button("Settings") {
                openWindow(value: AppWindow.settings)
            }
            .keyboardShortcut(",", modifiers: [.command])
            Button("Quit") {
                NSApplication.shared.terminate(self)
            }
            .keyboardShortcut("Q", modifiers: [.command])
        }
    }
}
