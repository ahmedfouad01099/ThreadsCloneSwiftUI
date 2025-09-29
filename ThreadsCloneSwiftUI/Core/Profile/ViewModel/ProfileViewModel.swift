//
//  ProfileViewModel.swift
//  ThreadsCloneSwiftUI
//
//  Created by Ahmed Fouad on 29/09/2025.
//

import Combine
import Foundation

class ProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()

    init() {
        setupSubscriptions()
    }

    private func setupSubscriptions() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
            print("debug: current user in view model from combine is \(user)")
        }.store(in: &cancellables)
    }
}
