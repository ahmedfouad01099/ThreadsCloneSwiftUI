//
//  ExploreView.swift
//  ThreadsCloneSwiftUI
//
//  Created by Ahmed Fouad on 23/09/2025.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText: String = ""
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    LazyVStack {
                        ForEach(0...10, id: \.self) { user in
                            VStack {
                                UserCell()

                                Divider()
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
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
