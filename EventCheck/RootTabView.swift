//
//  RootTabView.swift
//  EventCheck
//
//  Created by Ruth Okolo on 2026-01-08.
//

import SwiftUI

struct RootTabView: View {
    var body: some View {
        TabView {
            EventsView()
                .tabItem {
                    Label("Events", systemImage: "calendar")
                }

            ActivityView()
                .tabItem {
                    Label("Activity", systemImage: "waveform")
                }

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}



#Preview {
    RootTabView()
        .environmentObject(ThemeManager())
}
