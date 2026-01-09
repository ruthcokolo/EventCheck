//
//  AppTheme.swift
//  EventCheck
//
//  Created by Ruth Okolo on 2026-01-08.
//

import Foundation
import SwiftUI
import Combine

enum AppTheme: String, CaseIterable, Identifiable {
    case system = "System"
    case light = "Light"
    case dark  = "Dark"

    var id: String { rawValue }

    var colorScheme: ColorScheme? {
        switch self {
        case .system: return nil
        case .light:  return .light
        case .dark:   return .dark
        }
    }
}

final class ThemeManager: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    
    @AppStorage("app_theme") var storedTheme: String = AppTheme.system.rawValue

    var theme: AppTheme {
        get { AppTheme(rawValue: storedTheme) ?? .system }
        set { storedTheme = newValue.rawValue }
    }
}
