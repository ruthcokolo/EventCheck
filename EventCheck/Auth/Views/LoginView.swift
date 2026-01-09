//
//  LoginView.swift
//  EventCheck
//
//  Created by Ruth Okolo on 2026-01-08.
//

import SwiftUI

struct LoginView: View {
    @Binding var mode: AuthMode
    @EnvironmentObject private var session: SessionManager

    @State private var email: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String?

    var body: some View {
        ZStack {
            Color(.systemGroupedBackground).ignoresSafeArea()

            VStack(spacing: 20) {
                Spacer().frame(height: 32)

                VStack(spacing: 8) {
                    Text("EventCheck")
                        .font(.system(size: 34, weight: .semibold))
                        .foregroundStyle(.primary)

                    Text("Staff Check-In Portal")
                        .font(.system(size: 16))
                        .foregroundStyle(.secondary)
                }
                .padding(.top, 24)

                AuthSegmentedControl(selected: $mode)
                    .padding(.top, 10)

                VStack(alignment: .leading, spacing: 16) {

                    // MARK: Email
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Email")
                            .font(.system(size: 14, weight: .semibold))

                        ZStack(alignment: .leading) {
                            if email.isEmpty {
                                Text(verbatim: "staff@eventcheck.com")   // ✅ NOT blue
                                    .foregroundStyle(.secondary)
                                    .padding(.horizontal, 16)
                                    .allowsHitTesting(false)
                            }

                            TextField("", text: $email)
                                .textInputAutocapitalization(.never)
                                .keyboardType(.emailAddress)
                                .autocorrectionDisabled(true)
                                .textContentType(.none)
                                .foregroundStyle(.primary)
                                .padding()
                        }
                        .background(Color(.secondarySystemGroupedBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 12))

                    }

                    // MARK: Password
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Password")
                            .font(.system(size: 14, weight: .semibold))

                        SecureField("Enter your password", text: $password)
                            .padding()
                            .background(Color(.secondarySystemGroupedBackground))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                }
                .padding(.top, 6)

                // MARK: Error Message
                if let errorMessage {
                    Text(errorMessage)
                        .foregroundStyle(.red)
                        .font(.system(size: 13))
                }

                // MARK: Login Button
                Button {
                    handleLogin()
                } label: {
                    Text("Log In")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(Color.black)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                }
                .padding(.top, 6)

                Text("Demo: staff@eventcheck.com / demo")
                    .font(.system(size: 13))
                    .foregroundStyle(.secondary)
                    .padding(.top, 10)

                Spacer()
            }
            .padding(.horizontal, 24)
        }
    }

    // MARK: - Demo Login Logic
    private func handleLogin() {
        let trimmedEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedPassword = password.trimmingCharacters(in: .whitespacesAndNewlines)

        if trimmedEmail.lowercased() == "staff@eventcheck.com",
           trimmedPassword == "demo" {

            errorMessage = nil
            session.logIn()

        } else {
            errorMessage = "Invalid email or password"
        }
    }
}

#Preview {
    LoginView(mode: .constant(.login))
        .environmentObject(SessionManager())
}
