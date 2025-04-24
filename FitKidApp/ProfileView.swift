//
//  ProfileView.swift
//  FitKidApp
//
//  Created by Leslie Villalta on 4/23/25.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedAvatar = "🐱"

    var body: some View {
        ZStack {
            // Set background color for the entire view
            Color.fitMint
                .ignoresSafeArea() // Background color for the whole screen

            VStack(spacing: 20) {
                // Title
                Text("Your Avatar")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.fitOrange)
                    .padding()

                // Selected Avatar Display
                Text(selectedAvatar)
                    .font(.system(size: 80))
                    .padding()

                // Avatar Selection
                HStack(spacing: 20) {
                    ForEach(["🐱", "🐶", "🐵", "🐸"], id: \.self) { emoji in
                        Text(emoji)
                            .font(.system(size: 50))
                            .padding()
                            .background(Color.fitWhite)
                            .cornerRadius(12)
                            .shadow(radius: 4)
                            .onTapGesture {
                                selectedAvatar = emoji
                            }
                    }
                }
                .padding(.top, 20) // Adds spacing between the avatar and the selection options
            }
            .padding()
        }
        .navigationTitle("Profile")
    }
}
