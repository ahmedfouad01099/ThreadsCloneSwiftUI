//
//  CreateThreadView.swift
//  ThreadsCloneSwiftUI
//
//  Created by Ahmed Fouad on 23/09/2025.
//

import SwiftUI

struct CreateThreadView: View {
    @State private var caption: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .top) {
                    CircularProfileImageView()

                    VStack(alignment: .leading, spacing: 4) {
                        Text("Ahmed Fouad")
                            .fontWeight(.semibold)

                        TextField(
                            "Start a thread...",
                            text: $caption,
                            axis: .vertical
                        )
                    }
                    .font(.footnote)

                    Spacer()

                    if !caption.isEmpty {
                        Button {
                            caption = ""
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundColor(.gray)
                        }
                    }
                }

                Spacer()
            }
            .padding()
            .navigationTitle("New Thread")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Post") {

                    }
                    .opacity(caption.isEmpty ? 0.5 : 1.0)
                    .disabled(caption.isEmpty)
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                }
            }
        }
    }
}

#Preview {
    CreateThreadView()
}
