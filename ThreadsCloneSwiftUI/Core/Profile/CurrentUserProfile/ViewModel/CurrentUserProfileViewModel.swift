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
    @Published var selectedItem: PhotosPickerItem? {
        didSet { Task { await loadImage() } }
    }
    @Published var profileImage: Image?

    private var cancellables = Set<AnyCancellable>()

    init() {
        setupSubscriptions()
    }

    private func setupSubscriptions() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user

        }.store(in: &cancellables)
    }

    @MainActor
    private func loadImage() async {
        guard let item = selectedItem else { return }

        guard let data = try? await item.loadTransferable(type: Data.self)
        else { return }

        guard let uiImage = UIImage(data: data) else { return }
        self.profileImage = Image(uiImage: uiImage)
    }
}
