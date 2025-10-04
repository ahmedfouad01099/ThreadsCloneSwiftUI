//
//  UserCell.swift
//  ThreadsCloneSwiftUI
//
//  Created by Ahmed Fouad on 26/09/2025.
//

import SwiftUI

struct UserCell: View {
    let user: User

    var body: some View {
        HStack {
            CircularProfileImageView(user: user, size: .small)

            VStack(alignment: .leading, spacing: 4) {
                Text(user.username)
                    .fontWeight(.semibold)

                Text(user.fullname)
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
    UserCell(user: dev.user)
}
