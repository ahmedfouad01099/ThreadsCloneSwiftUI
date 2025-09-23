//
//  RegisterationView.swift
//  ThreadsCloneSwiftUI
//
//  Created by Ahmed Fouad on 23/09/2025.
//

import SwiftUI

struct RegisterationView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var fullname: String = ""
    @State private var username: String = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            Spacer()

            VStack {
                Image("threads-app-icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding()
            }

            VStack {
                TextField("Enter your email", text: $email)
                    .autocapitalization(.none)
                    .modifier(ThreadsTextFieldModifier())

                SecureField("Enter your password", text: $password)
                    .modifier(ThreadsTextFieldModifier())

                TextField("Enter your full name", text: $fullname)
                    .modifier(ThreadsTextFieldModifier())

                TextField("Enter your username", text: $username)
                    .modifier(ThreadsTextFieldModifier())
            }

            Button {

            } label: {
                Text("Sign Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 352, height: 44)
                    .background(.black)
                    .cornerRadius(8)
            }
            .padding(.vertical)

            Spacer()

            Divider()

            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
                .foregroundColor(.black)
            }
            .padding(.vertical, 16)

        }
    }
}

#Preview {
    RegisterationView()
}
