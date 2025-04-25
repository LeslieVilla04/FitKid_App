//
//  LessonsView.swift
//  FitKidApp
//
//  Created by Leslie Villalta on 4/23/25.
//

import SwiftUI

struct LessonsView: View {
    var body: some View {
        ZStack {
            Color.fitMint.ignoresSafeArea() // Set background color for the whole view

            VStack {
                Text("Choose a Lesson")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.fitOrange)
                    .padding()

                List {
                    // Emotions 101
                    NavigationLink(destination: EmotionsLessonView()) {
                        Text("Emotions 101")
                            .font(.title2)
                            .foregroundColor(.fitOrange)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.fitWhite)
                            .cornerRadius(12)
                            .shadow(radius: 4)
                    }


                    // Healthy Habits
                    NavigationLink(destination: HealthyHabitsLessonView()) {
                           Text("Healthy Habits")
                               .font(.title2)
                               .foregroundColor(.fitOrange)
                               .padding()
                               .frame(maxWidth: .infinity)
                               .background(Color.fitWhite)
                               .cornerRadius(12)
                               .shadow(radius: 4)
                       }


                    // Puberty Basics
                    NavigationLink(destination: PubertyBasicsLessonView()) {
                            Text("Puberty Basics")
                                .font(.title2)
                                .foregroundColor(.fitOrange)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.fitWhite)
                                .cornerRadius(12)
                                .shadow(radius: 4)
                        }
                }
                .listStyle(InsetGroupedListStyle()) // Adds nicer spacing and styling to the list
                .background(Color.fitMint) // Apply background color to the list
                .cornerRadius(12)
            }
            .padding()
        }
        .navigationTitle("Lessons")
    }
}
