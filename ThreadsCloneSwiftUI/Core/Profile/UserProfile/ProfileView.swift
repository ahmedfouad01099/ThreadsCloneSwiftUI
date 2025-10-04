//
//  ProfileView.swift
//  ThreadsCloneSwiftUI
//
//  Created by Ahmed Fouad on 23/09/2025.
//

import SwiftUI

struct ProfileView: View {
    let user: User

    var body: some View {
        VStack {
            // bio and stats
            VStack(spacing: 20) {
                ProfileHeaderView(user: user)

                Button {

                } label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 352, height: 32)
                        .background(.black)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                }

                // user content list view
                UserContentListView(user: user)
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)

    }

}

#Preview {
    ProfileView(user: dev.user)
}
