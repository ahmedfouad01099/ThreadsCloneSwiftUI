//
//  RegisterationViewModel.swift
//  ThreadsCloneSwiftUI
//
//  Created by Ahmed Fouad on 28/09/2025.
//

import Firebase
import FirebaseAuth

class RegisterationViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var fullname: String = ""
    @Published var username: String = ""

    @MainActor
    func createUser() async throws {
        try await AuthService.shared.createUser(
            withEmail: email,
            password: password,
            fullname: fullname,
            username: username
        )
    }
}
