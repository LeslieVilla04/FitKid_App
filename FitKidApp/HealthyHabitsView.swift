//
//  HealthyHabitsView.swift
//  FitKidApp
//
//  Created by Leslie Villalta on 4/24/25.
//

import SwiftUI

struct HealthyHabitsLessonView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // Title
                Text("Healthy Habits")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.fitOrange)

                // Intro
                Text("Healthy habits help your body and brain feel their best! From brushing your teeth to staying active, little routines make a big difference.")
                    .font(.body)
                    .foregroundColor(.fitBlue)

                // Habit 1: Brushing Teeth
                VStack(alignment: .leading, spacing: 12) {
                    Text("🦷 Brush Your Teeth")
                        .font(.title2)
                        .foregroundColor(.fitOrange)
                        .bold()

                    Text("Brush twice a day — once in the morning and once at night. This keeps your teeth strong, your breath fresh, and your smile bright!")
                        .foregroundColor(.fitBlue)
                }

                // Habit 2: Drink Water
                VStack(alignment: .leading, spacing: 12) {
                    Text("💧 Drink Water")
                        .font(.title2)
                        .foregroundColor(.fitOrange)
                        .bold()

                    Text("Your body needs water to stay cool, move around, and think clearly. Try to drink water throughout the day, especially after moving around or playing.")
                        .foregroundColor(.fitBlue)
                }

                // Habit 3: Get Good Sleep
                VStack(alignment: .leading, spacing: 12) {
                    Text("🛌 Get Good Sleep")
                        .font(.title2)
                        .foregroundColor(.fitOrange)
                        .bold()

                    Text("Sleep helps your brain learn and your body grow. A calm bedtime routine — like turning off screens, brushing your teeth, and reading — can help you fall asleep faster.")
                        .foregroundColor(.fitBlue)
                }

                // Bonus Tip
                VStack(alignment: .leading, spacing: 10) {
                    Text("💡 Bonus Tip")
                        .font(.headline)
                        .foregroundColor(.fitPeach)

                    Text("Moving your body, like stretching, walking, or dancing, also counts as a healthy habit. It wakes up your muscles and boosts your mood!")
                        .foregroundColor(.fitBlue)
                }
                .padding()
                .background(Color.fitPeach.opacity(0.2))
                .cornerRadius(10)

                // Reflect
                VStack(alignment: .leading, spacing: 12) {
                    Text("📝 Reflect")
                        .font(.title2)
                        .foregroundColor(.fitOrange)
                        .bold()

                    Text("Which healthy habit do you already do well? Is there one you'd like to do more often?")
                        .foregroundColor(.fitBlue)

                    Text("Try setting a tiny goal for the week, like brushing your teeth every night or drinking water after lunch.")
                        .foregroundColor(.fitBlue)
                        .italic()
                }

                Spacer()
            }
            .padding()
        }
        .background(Color.fitMint.ignoresSafeArea())
        .navigationTitle("Healthy Habits")
    }
}
