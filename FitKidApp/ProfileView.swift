//
//  ProfileView.swift
//  FitKidApp
//
//  Created by Leslie Villalta on 4/23/25.
//
import SwiftUI

struct ProfileView: View {
    @AppStorage("selectedAvatar") private var selectedAvatar = "🐱"
    @AppStorage("isLoggedIn") private var isLoggedIn = true
    @State private var notificationsEnabled = true
    @State private var soundEnabled = true

    var body: some View {
        ZStack {
            Color.fitMint.ignoresSafeArea()

            ScrollView {
                VStack(spacing: 30) {
                    // Avatar section
                    VStack(spacing: 20) {
                        Text("Your Avatar")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.fitOrange)

                        Text(selectedAvatar)
                            .font(.system(size: 80))

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
                    }

                    // Settings section
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Settings")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.fitBlue)
                            .padding(.bottom, 8)

                        Toggle(isOn: $notificationsEnabled) {
                            Label("Notifications", systemImage: "bell.fill")
                        }

                        Toggle(isOn: $soundEnabled) {
                            Label("Sound", systemImage: "speaker.wave.2.fill")
                        }
                        
                        Button(action: {
                            isLoggedIn = false
                        }) {
                            Text("Log Out")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.red)
                                .cornerRadius(12)
                                .shadow(radius: 4)
                        }
                        .padding(.top, 20)
                    }

                    .padding()
                    .background(Color.fitWhite)
                    .cornerRadius(12)
                    .shadow(radius: 4)
                }
                .padding()
            }
        }
        .navigationTitle("Profile & Settings")
    }
}
