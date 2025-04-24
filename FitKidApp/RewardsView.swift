//
//  RewardsView.swift
//  FitKidApp
//
//  Created by Leslie Villalta on 4/23/25.
//

import SwiftUI

struct RewardsView: View {
    var body: some View {
        ZStack {
            // Set background color for the entire view
            Color.fitMint
                .ignoresSafeArea() // Ensures the background color covers the whole screen

            VStack(spacing: 20) {
                // Title
                Text("Your Badges")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.fitOrange)
                    .padding()

                // Badges List
                VStack {
                    Text("🎖 Healthy Hero")
                        .font(.title2)
                        .foregroundColor(.fitOrange)
                        .padding()
                        .background(Color.fitWhite)
                        .cornerRadius(12)
                        .shadow(radius: 4)

                    Text("🏆 Quiz Master")
                        .font(.title2)
                        .foregroundColor(.fitOrange)
                        .padding()
                        .background(Color.fitWhite)
                        .cornerRadius(12)
                        .shadow(radius: 4)

                    Text("🌟 Consistency Champ")
                        .font(.title2)
                        .foregroundColor(.fitOrange)
                        .padding()
                        .background(Color.fitWhite)
                        .cornerRadius(12)
                        .shadow(radius: 4)
                }
                .padding(.top, 20) // Add some spacing between the title and badges
            }
        }
        .navigationTitle("Badges")
    }
}
