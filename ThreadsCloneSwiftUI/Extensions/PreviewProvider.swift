//
//  PreviewProvider.swift
//  ThreadsCloneSwiftUI
//
//  Created by Ahmed Fouad on 01/10/2025.
//

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
}

// MARK: - Global helper for previews
let dev = DeveloperPreview.shared
