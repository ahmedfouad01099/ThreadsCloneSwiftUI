//
//  SwiftUIView.swift
//  ThreadsCloneSwiftUI
//
//  Created by Ahmed Fouad on 23/09/2025.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        NavigationStack {
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
                        .modifier(ThreadsTextFieldModifier())

                    SecureField("Enter your password", text: $password)
                        .modifier(ThreadsTextFieldModifier())
                }

                NavigationLink {
                    Text("Forgot password")
                } label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.trailing, 28)
                        .padding(.vertical)
                }

                Button {

                } label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 352, height: 44)
                        .background(.black)
                        .cornerRadius(8)
                }

                Spacer()

                Divider()

                NavigationLink {
                    RegisterationView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                    .foregroundColor(.black)
                }
                .padding(.vertical, 16)
            }

        }
    }
}

#Preview {
    LoginView()
}
