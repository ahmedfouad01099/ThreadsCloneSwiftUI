//
//  UserCell.swift
//  ThreadsCloneSwiftUI
//
//  Created by Ahmed Fouad on 26/09/2025.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            CircularProfileImageView()

            VStack(alignment: .leading) {
                Text("Ahmed Fouad")
                    .fontWeight(.semibold)

                Text("Software Engineer")
            }
            .font(.footnote)

            Spacer()

            Text("Follow")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 100, height: 32)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(
                            Color(.systemGray4),
                            lineWidth: 1
                        )

                }
        }
    }
}

#Preview {
    UserCell()
}
