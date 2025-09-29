//
//  UserService.swift
//  ThreadsCloneSwiftUI
//
//  Created by Ahmed Fouad on 29/09/2025.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class UserService {
    @Published var currentUser: User?

    static let shared = UserService()

    init() {
        Task { try await fetchCurrentUser() }
    }

    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        do {
            let snapshot = try await Firestore.firestore().collection("users")
                .document(uid).getDocument()

            let user = try snapshot.data(as: User.self)

            self.currentUser = user

            print("debug: User is \(user)")
        } catch {
            print("debug: Error fetching current user: \(error)")
        }
    }
}
