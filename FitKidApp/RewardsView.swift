//
//  RewardsView.swift
//  FitKidApp
//
//  Created by Leslie Villalta on 4/23/25.
//

import SwiftUI

struct RewardsView: View {
    @AppStorage("earnedHealthyHero") private var earnedHealthyHero = false
    @AppStorage("earnedQuizMaster") private var earnedQuizMaster = false
    @AppStorage("earnedConsistencyChamp") private var earnedConsistencyChamp = false

    var body: some View {
        ZStack {
            Color.fitMint.ignoresSafeArea()

            VStack(spacing: 20) {
                Text("Your Badges")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.fitOrange)
                    .padding()

                if earnedHealthyHero || earnedQuizMaster || earnedConsistencyChamp {
                    VStack(spacing: 16) {
                        if earnedHealthyHero {
                            badgeView(text: "🎖 Healthy Hero")
                        }
                        if earnedQuizMaster {
                            badgeView(text: "🏆 Quiz Master")
                        }
                        if earnedConsistencyChamp {
                            badgeView(text: "🌟 Consistency Champ")
                        }
                    }
                    .padding(.top, 20)
                } else {
                    Text("You haven’t earned any badges yet.\nKeep going and they’ll show up here! 💪")
                        .multilineTextAlignment(.center)
                        .font(.title3)
                        .foregroundColor(.fitBlue)
                        .padding()
                        .background(Color.fitWhite)
                        .cornerRadius(12)
                        .shadow(radius: 4)
                        .padding(.top, 20)
                }
            }
        }
        .navigationTitle("Badges")
    }

    @ViewBuilder
    private func badgeView(text: String) -> some View {
        Text(text)
            .font(.title2)
            .foregroundColor(.fitOrange)
            .padding()
            .background(Color.fitWhite)
            .cornerRadius(12)
            .shadow(radius: 4)
    }
}
