//
//  Thread.swift
//  ThreadsCloneSwiftUI
//
//  Created by Ahmed Fouad on 04/10/2025.
//

import Firebase
import FirebaseFirestore

struct Thread: Identifiable, Codable {
    @DocumentID var threadId: String?

    let ownerId: String
    let caption: String
    let timestamp: Timestamp
    let likes: Int

    var id: String {
        return threadId ?? UUID().uuidString
    }
    var user: User?
}
