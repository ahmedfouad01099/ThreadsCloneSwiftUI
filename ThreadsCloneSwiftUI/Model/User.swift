//
//  User.swift
//  ThreadsCloneSwiftUI
//
//  Created by Ahmed Fouad on 29/09/2025.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: String?
    var bio: String?
}
