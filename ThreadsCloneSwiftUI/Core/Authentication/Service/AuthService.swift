//
//  AuthService.swift
//  ThreadsCloneSwiftUI
//
//  Created by Ahmed Fouad on 28/09/2025.
//

import Firebase
import FirebaseAuth

class AuthService {

    static let shared = AuthService()
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {

    }

    @MainActor
    func createUser(
        withEmail email: String,
        password: String,
        fullname: String,
        username: String
    ) async throws {
        do {
            let result = try await Auth.auth().createUser(
                withEmail: email,
                password: password
            )
            
            print("debug: \(result)")
        } catch {
            print(
                "debug: failed to create user with error \(error.localizedDescription)"
            )
        }
    }
}
