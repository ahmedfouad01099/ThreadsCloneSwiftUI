//
//  ContentViewModel.swift
//  ThreadsCloneSwiftUI
//
//  Created by Ahmed Fouad on 29/09/2025.
//

import Combine
import Firebase
import FirebaseAuth
import Foundation

class ContentViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()

    init() {
        setupSubscribers()
    }

    private func setupSubscribers() {
        AuthService.shared.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }.store(in: &cancellables)
    }
}
