//
//  CurrentUserProfileViewModel.swift
//  ThreadsCloneSwiftUI
//
//  Created by Ahmed Fouad on 01/10/2025.
//

import Combine
import Foundation
import PhotosUI
import SwiftUI

class CurrentUserProfileViewModel: ObservableObject {
    @Published var currentUser: User?

    private var cancellables = Set<AnyCancellable>()

    init() {
        setupSubscriptions()
    }

    private func setupSubscriptions() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user

        }.store(in: &cancellables)
    }
}
