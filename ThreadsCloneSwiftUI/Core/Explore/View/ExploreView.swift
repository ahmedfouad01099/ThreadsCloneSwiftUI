//
//  ExploreView.swift
//  ThreadsCloneSwiftUI
//
//  Created by Ahmed Fouad on 23/09/2025.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText: String = ""
    @StateObject var viewModel = ExploreViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.users) { user in
                            NavigationLink(value: user) {
                                VStack {
                                    UserCell(user: user)

                                    Divider()
                                }
                                .padding(.vertical, 4)
                            }
                        }
                    }
                }
                .navigationDestination(
                    for: User.self,
                    destination: {
                        user
                        in
                        ProfileView(user: user)
                    }
                )
                .searchable(text: $searchText, prompt: "Search")
                .navigationTitle("Search")
            }
            .padding()
        }
    }
}

#Preview {
    ExploreView()
}
