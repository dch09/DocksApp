//
//  Window.swift
//  DocksApp
//
//  Created by Daniel Choroszucha on 08/10/2022.
//

import SwiftUI

struct Window: View {
    @Binding var type: AppWindow?

    var body: some View {
        switch type {
        case .settings: SettingsView()
        case .onboarding: ContentView()
        default: EmptyView()
        }
    }
}

struct Window_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Window(type: .constant(.settings))
            Window(type: .constant(.onboarding))
        }
    }
}
