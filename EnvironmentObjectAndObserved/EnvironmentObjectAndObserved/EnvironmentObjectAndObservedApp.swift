//
//  EnvironmentObjectAndObservedApp.swift
//  EnvironmentObjectAndObserved
//
//  Created by Sinuhe Alvarez Ruedas on 13/11/25.
//

import SwiftUI

@main
struct EnvironmentObjectAndObservedApp: App {
    @StateObject private var userSettings = UserSettings()
    
    var body: some Scene {
        WindowGroup {
            EnvironmentAndObservedExample()
                .environmentObject(userSettings)
                .environment(\.colorScheme, userSettings.prefersDarkMode ? .dark : .light)
        }
    }
}
