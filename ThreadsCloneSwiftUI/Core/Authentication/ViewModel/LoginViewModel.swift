//
//  LoginViewModel.swift
//  ThreadsCloneSwiftUI
//
//  Created by Ahmed Fouad on 29/09/2025.
//

import Firebase
import FirebaseAuth

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""

    @MainActor
    func login() async throws {
        try await AuthService.shared.login(
            withEmail: email,
            password: password
        )
    }
}
