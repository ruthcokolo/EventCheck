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
    @State private var session = SessionManager()

    var body: some Scene {
        WindowGroup {
            AppRouter()
                .environmentObject(themeManager)
                .environmentObject(session)
                .preferredColorScheme(themeManager.theme.colorScheme)
        }
    }
}

struct AppRootView: View {
    @EnvironmentObject private var session: SessionManager


    var body: some View {
        if session.isAuthenticated {
            RootTabView()
        } else {
            AuthSwitcherView()
        }
    }
}
