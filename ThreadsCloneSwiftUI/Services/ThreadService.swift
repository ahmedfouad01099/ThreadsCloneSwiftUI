//
//  ThreadService.swift
//  ThreadsCloneSwiftUI
//
//  Created by Ahmed Fouad on 04/10/2025.
//

import Firebase
import FirebaseFirestore
import Foundation

struct ThreadService {
    static func uploadThread(_ thread: Thread) async throws {
        guard let threadData = try? Firestore.Encoder().encode(thread) else {
            return
        }

        try await Firestore.firestore().collection("threads").addDocument(
            data: threadData
        )
    }

    static func fetchThreads() async throws -> [Thread] {
        let snapshot = try await Firestore.firestore().collection("threads")
            .order(by: "timestamp", descending: true).getDocuments()

        return snapshot.documents.compactMap { try? $0.data(as: Thread.self) }
    }
}
