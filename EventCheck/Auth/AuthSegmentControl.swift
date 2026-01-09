//
//  AuthSegmentControl.swift
//  EventCheck
//
//  Created by Ruth Okolo on 2026-01-08.
//

import Foundation

import SwiftUI

struct AuthSegmentedControl: View {
    @Binding var selected: AuthMode
    
    var body: some View {
        HStack(spacing: 0) {
            segment(.login)
            segment(.signup)
        }
        .padding(4)
        .background(Color(.secondarySystemGroupedBackground))
        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
        .shadow(color: .black.opacity(0.06), radius: 10, x: 0, y: 6)
    }
    
    private func segment(_ mode: AuthMode) -> some View {
        Button {
            selected = mode
        } label: {
            Text(mode.rawValue)
                .font(.system(size: 15, weight: .semibold))
                .foregroundStyle(selected == mode ? .black : .secondary)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .background(
                    Group {
                        if selected == mode {
                            Color(.systemBackground)
                                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                        } else {
                            Color.clear
                        }
                    }
                )
        }
        .buttonStyle(.plain)
    }
}
