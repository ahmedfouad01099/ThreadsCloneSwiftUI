//
//  CurrentUserProfileView.swift
//  ThreadsCloneSwiftUI
//
//  Created by Ahmed Fouad on 01/10/2025.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @StateObject var viewModel = CurrentUserProfileViewModel()
    @State private var showEditProfile = false

    private var currentUser: User? {
        return viewModel.currentUser
    }

    var body: some View {
        NavigationStack {
            VStack {
                // bio and stats
                VStack(spacing: 20) {
                    ProfileHeaderView(user: currentUser)

                    Button {
                        showEditProfile.toggle()
                    } label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 352, height: 32)
                            .background(.white)
                            .foregroundColor(.black)
                            .cornerRadius(8)
                            .overlay {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color(.systemGray4), lineWidth: 1)
                            }
                    }

                    // user content list view
                    UserContentListView()

                    ScrollView(showsIndicators: false) {
                        LazyVStack {
                            ForEach(0...10, id: \.self) { thread in
                                ThreadCell()
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }
                .padding()
            }
            .sheet(
                isPresented: $showEditProfile,
                content: {
                    EditProfileView()
                        .environmentObject(viewModel)
                }
            )
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        AuthService.shared.signOut()
                    } label: {
                        Text("Logout")
                    }
                }
            }
        }
    }

}

#Preview {
    CurrentUserProfileView()
}
