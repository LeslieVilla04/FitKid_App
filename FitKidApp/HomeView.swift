//
//  HomeView.swift
//  FitKidApp
//
//  Created by Leslie Villalta on 4/23/25.
//

import SwiftUI

struct HomeView: View {
    // Retrieve the stored username
    @AppStorage("username") private var storedUsername: String?
    @AppStorage("selectedAvatar") private var selectedAvatar = "🐱"
    
    // Retrieve quiz and habit progress
    @AppStorage("quizProgress") private var quizProgress: String = "Not Started"
    @AppStorage("habitCompletion") private var habitCompletionData: Data?
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.fitMint.ignoresSafeArea()

                VStack(spacing: 30) {
                    // Display the user's name if available, otherwise a default message
                    Text("Welcome back, \(storedUsername ?? "Kiddo")!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.fitOrange)

                    Text(selectedAvatar)
                        .font(.system(size: 100))

                    // Display quiz progress
                    Text("Quiz Progress: \(quizProgress == "Completed" ? "✅ Completed!" : quizProgress == "In Progress" ? "🔄 In Progress" : "🕒 Not Started")")
                        .font(.title2)
                        .foregroundColor(.fitOrange)
                    
                    // Display habit progress
                    let habitsCompleted = habitCompletionData != nil && !habitCompletionData!.isEmpty
                    Text("Habits Progress: \(habitsCompleted ? "✅ Completed!" : "🕒 Incomplete")")
                        .font(.title2)
                        .foregroundColor(.fitOrange)

                    // Start a Lesson
                    NavigationLink(destination: LessonsView()) {
                        HStack {
                            Image(systemName: "book.fill")
                                .foregroundColor(.fitOrange)
                            Text("Start a Lesson")
                                .foregroundColor(.fitOrange)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.fitWhite)
                        .cornerRadius(12)
                        .shadow(radius: 4)
                    }

                    // Check Habits
                    NavigationLink(destination: HabitTrackerView()) {
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.fitOrange)
                            Text("Check Habits")
                                .foregroundColor(.fitOrange)
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
}
