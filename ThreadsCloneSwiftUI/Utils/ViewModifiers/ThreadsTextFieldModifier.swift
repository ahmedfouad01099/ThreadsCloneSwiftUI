//
//  ThreadsTextFieldModifier.swift
//  ThreadsCloneSwiftUI
//
//  Created by Ahmed Fouad on 23/09/2025.
//

import SwiftUI

struct ThreadsTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .padding(.horizontal, 24)
    }
}
