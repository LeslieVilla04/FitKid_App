//
//  LoginView.swift
//  FitKidApp
//
//  Created by Leslie Villalta on 4/23/25.
//

import SwiftUI

struct LoginView: View {
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    @State private var username = "" // Add a variable to store the user's name

    // Use @AppStorage to store the name and persist it across app sessions
    @AppStorage("username") private var storedUsername: String?

    var body: some View {
        if isLoggedIn {
            MainTabView()
        } else {
            ZStack {
                Color.fitMint.ignoresSafeArea()

                VStack(spacing: 30) {
                    Text("Welcome to FitKid!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.fitOrange)
                        .multilineTextAlignment(.center)

                    TextField("Enter your name", text: $username)
                        .padding()
                        .background(Color.fitWhite)
                        .cornerRadius(12)
                        .shadow(radius: 4)

                    Button(action: {
                        storedUsername = username // Save the name when logging in
                        isLoggedIn = true
                    }) {
                        Text("Log In")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.fitOrange)
                            .foregroundColor(.fitWhite)
                            .cornerRadius(12)
                            .shadow(radius: 4)
                    }
                    .padding(.horizontal)
                }
                .padding()
            }
        }
    }
}
