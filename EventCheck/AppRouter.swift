//
//  AppRouter.swift
//  EventCheck
//
//  Created by Ruth Okolo on 2026-01-09.
//

import SwiftUI

struct AppRouter: View {
    @EnvironmentObject private var session: SessionManager
    @State private var mode: AuthMode = .login

    var body: some View {
        if session.isAuthenticated {
            RootTabView()
        } else {
            AuthSwitcherView() // or LoginView(mode: $mode)
        }
    }
}

