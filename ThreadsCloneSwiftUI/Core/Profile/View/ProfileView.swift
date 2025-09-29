//
//  ProfileView.swift
//  ThreadsCloneSwiftUI
//
//  Created by Ahmed Fouad on 23/09/2025.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()

    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)

        return UIScreen.main.bounds.width / count - 16
    }

    private var currentUser: User? {
        return viewModel.currentUser
    }

    var body: some View {
        NavigationStack {
            VStack {
                // bio and stats
                VStack(spacing: 20) {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 12) {
                            // fullname and username
                            VStack(alignment: .leading, spacing: 4) {
                                Text(currentUser?.fullname ?? "")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                Text(currentUser?.username ?? "")
                                    .font(.subheadline)
                            }

                            if let bio = currentUser?.bio {
                                Text(bio)
                                    .font(.footnote)
                            }

                            Text("22 followers")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }

                        Spacer()

                        CircularProfileImageView()
                    }

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
                    VStack {
                        HStack {
                            ForEach(ProfileThreadFilter.allCases) { filter in
                                filterItemView(for: filter)
                            }
                        }
                    }

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

    // Extracted function to simplify the complex expression
    private func filterItemView(for filter: ProfileThreadFilter) -> some View {
        VStack {
            Text(filter.title)
                .font(.subheadline)
                .fontWeight(selectedFilter == filter ? .semibold : .regular)

            Rectangle()
                .foregroundColor(selectedFilter == filter ? .black : .clear)
                .frame(width: filterBarWidth, height: 1)
                .matchedGeometryEffect(
                    id: filter == selectedFilter ? "underline" : nil,
                    in: animation
                )
        }
        .onTapGesture {
            withAnimation(.spring()) {
                selectedFilter = filter
            }
        }
    }
}

#Preview {
    ProfileView()
}
