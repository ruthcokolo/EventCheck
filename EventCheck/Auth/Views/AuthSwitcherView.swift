//
//  AuthSwitcherView.swift
//  EventCheck
//
//  Created by Ruth Okolo on 2026-01-08.
//

import SwiftUI

struct AuthSwitcherView: View {
    @State private var mode: AuthMode = .login

    var body: some View {
        Group {
            if mode == .login {
                LoginView(mode: $mode)
            } else {
                SignUpView(mode: $mode)
            }
        }
    }
}

#Preview {
    AuthSwitcherView()
}
