//
//  CreateThreadViewModel.swift
//  ThreadsCloneSwiftUI
//
//  Created by Ahmed Fouad on 04/10/2025.
//

import Firebase
import FirebaseAuth

class CreateThreadViewModel: ObservableObject {

    func uploadThread(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }

        let thread = Thread(
            ownerId: uid,
            caption: caption,
            timestamp: Date(),
            likes: 0
        )

        try await ThreadService.uploadThread(thread)
    }
}
