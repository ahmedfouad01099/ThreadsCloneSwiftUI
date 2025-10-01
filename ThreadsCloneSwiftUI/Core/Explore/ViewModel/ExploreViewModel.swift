//
//  ExploreViewModel.swift
//  ThreadsCloneSwiftUI
//
//  Created by Ahmed Fouad on 01/10/2025.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()

    init() {
        Task { try await fetchUsers() }
    }

    private func fetchUsers() async throws {
        self.users = try await UserService.fetchUsers()
    }
}
