//
//  AuthService.swift
//  ThreadsCloneSwiftUI
//
//  Created by Ahmed Fouad on 28/09/2025.
//

import Firebase
import FirebaseAuth

class AuthService {

    @Published var userSession: FirebaseAuth.User?

    static let shared = AuthService()

    init() {
        self.userSession = Auth.auth().currentUser
    }
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(
                withEmail: email,
                password: password
            )
            self.userSession = result.user

            print("debug: logged in user \(result)")
        } catch {
            print(
                "debug: failed to login user with error \(error.localizedDescription)"
            )
        }
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
            self.userSession = result.user

            print("debug: created user \(result)")
        } catch {
            print(
                "debug: failed to create user with error \(error.localizedDescription)"
            )
        }
    }

    func signOut() {
        try? Auth.auth().signOut()
        self.userSession = nil
    }
}
