//
//  SessionManager.swift
//  EventCheck
//
//  Created by Ruth Okolo on 2026-01-09.
//

import Foundation
import Combine
import SwiftUI

final class SessionManager: ObservableObject {

    @Published var isAuthenticated: Bool {
        didSet {
            UserDefaults.standard.set(isAuthenticated, forKey: "isAuthenticated")
        }
    }

    init() {
        self.isAuthenticated = UserDefaults.standard.bool(forKey: "isAuthenticated")
    }

    func logIn() {
        isAuthenticated = true
    }

    func logOut() {
        isAuthenticated = false
    }
}
