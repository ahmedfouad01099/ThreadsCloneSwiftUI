//
//  UserContentListView.swift
//  ThreadsCloneSwiftUI
//
//  Created by Ahmed Fouad on 02/10/2025.
//

import SwiftUI

struct UserContentListView: View {
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)

        return UIScreen.main.bounds.width / count - 16
    }

    var body: some View {
        VStack {
            HStack {
                ForEach(ProfileThreadFilter.allCases) { filter in
                    filterItemView(for: filter)
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
    UserContentListView()
}
