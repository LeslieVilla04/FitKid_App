//
//  LoginView.swift
//  FitKidApp
//
//  Created by Leslie Villalta on 4/23/25.
//

import SwiftUI

struct LoginView: View {
    @State private var isLoggedIn = false

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

                    Button(action: {
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
