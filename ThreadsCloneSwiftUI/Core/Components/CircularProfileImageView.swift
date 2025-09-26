//
//  CircularProfileImageView.swift
//  ThreadsCloneSwiftUI
//
//  Created by Ahmed Fouad on 26/09/2025.
//

import SwiftUI

struct CircularProfileImageView: View {
    var body: some View {
        Image("ahmed")
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
    }
}

#Preview {
    CircularProfileImageView()
}
