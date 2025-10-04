//
//  EditProfileView.swift
//  ThreadsCloneSwiftUI
//
//  Created by Ahmed Fouad on 27/09/2025.
//

import PhotosUI
import SwiftUI

struct EditProfileView: View {
    let user: User

    @State private var bioText = ""
    @State private var link = ""
    @State private var isPrivateProfile: Bool = false
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = EditProfileViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                    .edgesIgnoringSafeArea([.bottom, .horizontal])

                VStack {
                    // name and profile
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.semibold)

                            Text(user.fullname)
                        }

                        Spacer()

                        PhotosPicker(selection: $viewModel.selectedItem) {
                            if let image = viewModel.profileImage {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                            } else {
                                CircularProfileImageView(
                                    user: user,
                                    size: .medium
                                )
                            }
                        }
                    }

                    Divider()

                    // bio field
                    VStack(alignment: .leading) {
                        Text("Bio")
                            .fontWeight(.semibold)

                        TextField(
                            "Enter your bio..",
                            text: $bioText,
                            axis: .vertical
                        )
                    }

                    Divider()

                    // link field
                    VStack(alignment: .leading) {
                        Text("Link")
                            .fontWeight(.semibold)

                        TextField(
                            "Add link...",
                            text: $link
                        )
                    }

                    Divider()

                    Toggle("Private profile", isOn: $isPrivateProfile)
                }
                .font(.footnote)
                .padding()
                .background(.white)
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                }
                .cornerRadius(10)

            }
            .navigationTitle("Edit Profile")
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
                    Button("Done") {
                        Task {
                            try? await viewModel.updateUserData()
                            dismiss()
                        }
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)

                }
            }
        }
    }
}

#Preview {
    EditProfileView(user: dev.user)
}
