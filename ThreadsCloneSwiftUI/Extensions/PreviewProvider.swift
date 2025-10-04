//
//  PreviewProvider.swift
//  ThreadsCloneSwiftUI
//
//  Created by Ahmed Fouad on 01/10/2025.
//

import Firebase
import SwiftUI

// MARK: - Developer Preview Singleton
final class DeveloperPreview {
    static let shared = DeveloperPreview()
    private init() {}

    let user = User(
        id: NSUUID().uuidString,
        fullname: "Ahmed Fouad",
        email: "ahmedfouad@gmail.com",
        username: "ahmed_fouad"
    )

    let thread = Thread(
        threadId: "123",
        ownerId: "111",
        caption: "This is a test Thread",
        timestamp: Timestamp(),
        likes: 0
    )
}

// MARK: - Global helper for previews
let dev = DeveloperPreview.shared
