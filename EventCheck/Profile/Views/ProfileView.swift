//
//  ProfileView.swift
//  EventCheck
//
//  Created by Ruth Okolo on 2026-01-08.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var themeManager: ThemeManager
    @EnvironmentObject private var session: SessionManager

    // demo data (replace later)
    private let name = "Sarah Chen"
    private let email = "staff@eventcheck.com"
    private let role = "Event Staff"

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                profileCard

                themeSection

                Spacer()

                logoutButton
                    .padding(.bottom, 10)
            }
            .padding(.horizontal, 16)
            .padding(.top, 12)
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.large)
        }
    }

    private var profileCard: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack(spacing: 14) {
                ZStack {
                    Circle()
                        .fill(Color.blue.opacity(0.15))
                        .frame(width: 56, height: 56)

                    Image(systemName: "person")
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundStyle(.blue)
                }

                VStack(alignment: .leading, spacing: 4) {
                    Text(name)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(.primary)

                    Text(email)
                        .font(.system(size: 14))
                        .foregroundStyle(.secondary)
                }

                Spacer()
            }

            Divider()

            Text(role)
                .font(.system(size: 14, weight: .medium))
                .foregroundStyle(.blue)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(Color.blue.opacity(0.12))
                .clipShape(Capsule())
        }
        .padding(16)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(Color.black.opacity(0.08), lineWidth: 1)
        )
        .shadow(color: .black.opacity(0.04), radius: 12, x: 0, y: 8)
        .padding(.top, 4)
    }

    private var themeSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Accessibility")
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(.secondary)

            HStack {
                Image(systemName: "circle.lefthalf.filled")
                    .foregroundStyle(.secondary)

                Text("Appearance")
                    .font(.system(size: 16, weight: .medium))

                Spacer()

                Picker("Appearance", selection: Binding(
                    get: { themeManager.theme },
                    set: { themeManager.theme = $0 }
                )) {
                    ForEach(AppTheme.allCases) { theme in
                        Text(theme.rawValue).tag(theme)
                    }
                }
                .pickerStyle(.menu)
                .tint(.blue)
            }
            .padding(14)
            .background(Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .stroke(Color.black.opacity(0.08), lineWidth: 1)
            )
        }
        .padding(.top, 6)
    }

    private var logoutButton: some View {
        Button {
            // TODO: hook to auth
            session.logOut()
            print("Log out tapped")
        } label: {
            HStack(spacing: 10) {
                Label("Log Out", systemImage: "arrow.right.square")
            }
            .foregroundStyle(.red)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .stroke(Color.red.opacity(0.35), lineWidth: 1)
            )
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ProfileView()
        .environmentObject(ThemeManager())
        .environmentObject(SessionManager())
}
