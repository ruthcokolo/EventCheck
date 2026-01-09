//
//  SignUpView.swift
//  EventCheck
//
//  Created by Ruth Okolo on 2026-01-08.
//

import SwiftUI

struct SignUpView: View {
    @Binding var mode: AuthMode

    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""

    var body: some View {
        ZStack {
            Color(.systemGroupedBackground).ignoresSafeArea()

            VStack(spacing: 20) {
                Spacer().frame(height: 32)

                VStack(spacing: 8) {
                    Text("EventCheck")
                        .font(.system(size: 34, weight: .semibold))
                        .foregroundStyle(.black)

                    Text("Staff Check-In Portal")
                        .font(.system(size: 16))
                        .foregroundStyle(.secondary)
                }
                .padding(.top, 24)

                AuthSegmentedControl(selected: $mode)
                    .padding(.top, 10)

                VStack(alignment: .leading, spacing: 16) {
                    formField(title: "First Name", placeholder: "Enter your first name", text: $firstName)
                    formField(title: "Last Name", placeholder: "Enter your last name", text: $lastName)
                    formField(title: "Email", placeholder: "staff@eventcheck.com", text: $email)
                }
                .padding(.top, 6)

                Button {
                    print("Tapped Sign Up")
                } label: {
                    Text("Sign Up")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(Color.black)
                        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                }
                .padding(.top, 6)

                Spacer()
            }
            .padding(.horizontal, 24)
        }
    }

    private func formField(title: String, placeholder: String, text: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(.black)

            TextField(placeholder, text: text)
                .textInputAutocapitalization(title.contains("Email") ? .never : .words)
                .keyboardType(title.contains("Email") ? .emailAddress : .default)
                .autocorrectionDisabled(title.contains("Email"))
                .padding()
                .background(Color(.secondarySystemGroupedBackground))
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        }
    }
}

#Preview {
    SignUpView(mode: .constant(.signup))
}
