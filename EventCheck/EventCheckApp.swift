//
//  EventCheckApp.swift
//  EventCheck
//
//  Created by Ruth Okolo on 2026-01-08.
//

import SwiftUI

@main
struct EventCheckApp: App {
    @StateObject private var themeManager = ThemeManager()

    var body: some Scene {
        WindowGroup {
            RootTabView()
                .environmentObject(themeManager)
                .preferredColorScheme(themeManager.theme.colorScheme)
        }
    }
}
