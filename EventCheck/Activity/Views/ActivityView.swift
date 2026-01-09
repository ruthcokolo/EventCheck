//
//  ActivityView.swift
//  EventCheck
//
//  Created by Ruth Okolo on 2026-01-08.
//

import SwiftUI

// MARK: - Model

struct ActivityItem: Identifiable, Hashable {
    let id = UUID()
    let staffName: String
    let eventName: String
    let timeLabel: String
    let status: Status

    enum Status: String, CaseIterable {
        case success
        case pending
        case failed

        var iconName: String {
            switch self {
            case .success: return "checkmark.circle.fill"
            case .pending: return "clock.fill"
            case .failed:  return "xmark.octagon.fill"
            }
        }

        var iconColor: Color {
            switch self {
            case .success: return .green
            case .pending: return .orange
            case .failed:  return .red
            }
        }
    }

    // Demo data (mock)
    static let sample: [ActivityItem] = [
        .init(staffName: "Jessica Williams", eventName: "TechConf 2026", timeLabel: "2 minutes ago", status: .success),
        .init(staffName: "Michael Chen", eventName: "TechConf 2026", timeLabel: "15 minutes ago", status: .success),
        .init(staffName: "Christopher Brown", eventName: "Design Summit", timeLabel: "1 hour ago", status: .success),
        .init(staffName: "Sarah Johnson", eventName: "TechConf 2026", timeLabel: "2 hours ago", status: .success),
        .init(staffName: "Amanda Garcia", eventName: "Product Innovation Forum", timeLabel: "Yesterday at 4:30 PM", status: .success)
    ]
}

// MARK: - View

struct ActivityView: View {
    // For now: mock activity feed
    @State private var items: [ActivityItem] = ActivityItem.sample

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground).ignoresSafeArea()

                if items.isEmpty {
                    emptyState
                } else {
                    ScrollView {
                        VStack(spacing: 14) {
                            ForEach(items) { item in
                                ActivityCard(item: item)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 10)
                        .padding(.bottom, 20)
                    }
                }
            }
            .navigationTitle("Activity")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        // Replace later with real refresh.
                        // For now, toggle to demonstrate empty state.
                        withAnimation(.easeInOut) {
                            items = items.isEmpty ? ActivityItem.sample : []
                        }
                    } label: {
                        Image(systemName: "arrow.clockwise")
                    }
                    .accessibilityLabel("Refresh activity")
                }
            }
        }
    }

    private var emptyState: some View {
        VStack(spacing: 10) {
            Image(systemName: "waveform")
                .font(.system(size: 40, weight: .semibold))
                .foregroundStyle(.secondary)

            Text("No activity yet")
                .font(.title3.weight(.semibold))

            Text("Activity will appear here when staff begin checking in.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
        }
        .padding(.top, 40)
    }
}

// MARK: - Card

private struct ActivityCard: View {
    let item: ActivityItem

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: item.status.iconName)
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(item.status.iconColor)

            VStack(alignment: .leading, spacing: 6) {
                Text(item.staffName)
                    .font(.headline)

                Text(item.eventName)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                Text(item.timeLabel)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            Spacer(minLength: 0)
        }
        .padding(16)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .stroke(Color.black.opacity(0.08), lineWidth: 1)
        )
        .shadow(color: .black.opacity(0.04), radius: 10, x: 0, y: 6)
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(item.staffName), \(item.eventName), \(item.timeLabel)")
    }
}

#Preview {
    ActivityView()
}
