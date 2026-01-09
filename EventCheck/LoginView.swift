//
//  LoginView.swift
//  EventCheck
//
//  Created by Ruth Okolo on 2026-01-08.
//

import SwiftUI

struct LoginView: View {
    @Binding var mode: AuthMode

    @State private var email: String = ""
    @State private var password: String = ""

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
                        .font(.system(size: 16, weight: .regular))
                        .foregroundStyle(.secondary)
                }
                .padding(.top, 24)

                AuthSegmentedControl(selected: $mode)
                    .padding(.top, 10)

                VStack(alignment: .leading, spacing: 16) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Email")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundStyle(.black)

                        TextField("staff@eventcheck.com", text: $email)
                            .textInputAutocapitalization(.never)
                            .keyboardType(.emailAddress)
                            .autocorrectionDisabled(true)
                            .padding()
                            .background(Color(.secondarySystemGroupedBackground))
                            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                    }

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Password")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundStyle(.black)

                        SecureField("Enter your password", text: $password)
                            .padding()
                            .background(Color(.secondarySystemGroupedBackground))
                            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                    }
                }
                .padding(.top, 6)

                Button {
                    print("Tapped Log In")
                } label: {
                    Text("Log In")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(Color.black)
                        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
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
}

#Preview {
    LoginView(mode: .constant(.login))
}
