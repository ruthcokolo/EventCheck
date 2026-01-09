//
//  EventsView.swift
//  EventCheck
//
//  Created by Ruth Okolo on 2026-01-08.
//

import SwiftUI

// MARK: - Model

struct Event: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let dateText: String
    let locationText: String
}

// MARK: - View

struct EventsView: View {
    @State private var events: [Event] = []   // Starts EMPTY
    @State private var isLoading = false

    var body: some View {
        NavigationStack {
            Group {
                if events.isEmpty {
                    emptyState
                } else {
                    eventsList
                }
            }
            .navigationTitle("My Events")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        Task { await refresh() }
                    } label: {
                        Image(systemName: "arrow.clockwise")
                    }
                    .disabled(isLoading)
                }
            }
        }
    }

    private var emptyState: some View {
        VStack(spacing: 12) {
            Spacer()

            Image(systemName: "calendar")
                .font(.system(size: 44, weight: .regular))
                .foregroundStyle(.secondary)

            Text("No events yet")
                .font(.headline)

            Text("When you’re assigned to an event, it will show up here.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGroupedBackground))
    }

    private var eventsList: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(events) { event in
                    EventCard(event: event)
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
            .padding(.bottom, 24)
        }
        .background(Color(.systemGroupedBackground))
    }

    // MARK: - Demo refresh (swap with real API later)

    private func refresh() async {
        isLoading = true
        defer { isLoading = false }

        // Simulate network delay
        try? await Task.sleep(nanoseconds: 500_000_000)

        // For now: toggle demo data on/off so you can SEE the UI.
        if events.isEmpty {
            events = [
                Event(title: "TechConf 2026", dateText: "Jan 15, 2026", locationText: "San Francisco, CA"),
                Event(title: "Design Summit", dateText: "Jan 22, 2026", locationText: "New York, NY"),
                Event(title: "Product Innovation Forum", dateText: "Feb 5, 2026", locationText: "Austin, TX")
            ]
        } else {
            events = []
        }
    }
}

// MARK: - Card Row

private struct EventCard: View {
    let event: Event

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(event.title)
                        .font(.headline)
                        .foregroundStyle(.primary)

                    Spacer()

                    Image(systemName: "chevron.right")
                        .foregroundStyle(.tertiary)
                        .font(.system(size: 14, weight: .semibold))
                }

                HStack(spacing: 10) {
                    Label(event.dateText, systemImage: "calendar")
                        .labelStyle(.titleAndIcon)
                        .foregroundStyle(.secondary)
                        .font(.subheadline)

                    Spacer()
                }

                HStack(spacing: 10) {
                    Label(event.locationText, systemImage: "mappin.and.ellipse")
                        .labelStyle(.titleAndIcon)
                        .foregroundStyle(.secondary)
                        .font(.subheadline)

                    Spacer()
                }
            }
        }
        .padding(16)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(Color.black.opacity(0.06), lineWidth: 1)
        )
    }
}

#Preview {
    EventsView()
}
