//
//  HomeView.swift
//  FitKidApp
//
//  Created by Leslie Villalta on 4/23/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.fitMint.ignoresSafeArea() // background

            VStack(spacing: 30) {
                Text("Welcome back, Kiddo!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.fitOrange)
                
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.fitOrange) // icon color

                Text("Your Progress: ⭐️⭐️")
                    .font(.title2)
                    .foregroundColor(.fitOrange)

                Button(action: {
                    // Add navigation action here
                }) {
                    HStack {
                        Image(systemName: "book.fill") // Icon for lessons
                            .foregroundColor(.fitOrange) // icon color
                        Text("Start a Lesson")
                            .foregroundColor(.fitOrange) // text color
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.fitWhite)
                    .cornerRadius(12)
                    .shadow(radius: 4)
                }

                Button(action: {
                    // Add navigation action here
                }) {
                    HStack {
                        Image(systemName: "checkmark.circle.fill") // Icon for habits
                            .foregroundColor(.fitOrange) // icon color
                        Text("Check Habits")
                            .foregroundColor(.fitOrange) // text color
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.fitWhite)
                    .cornerRadius(12)
                    .shadow(radius: 4)
                }
            }
            .padding()
        }
    }
}
