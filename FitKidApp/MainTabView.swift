//
//  MainTabView.swift
//  FitKidApp
//
//  Created by Leslie Villalta on 4/23/25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            // 🏠 Home Tab
            NavigationView {
                HomeView()
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }

            // 📚 Lessons Tab
            NavigationView {
                LessonsView()
            }
            .tabItem {
                Label("Lessons", systemImage: "book")
            }

            // ✅ Habits Tab
            NavigationView {
                HabitTrackerView()
            }
            .tabItem {
                Label("Habits", systemImage: "checkmark.circle")
            }

            // ❓ Quiz Tab (needs NavigationView for NavigationLink)
            NavigationView {
                QuizView()
            }
            .tabItem {
                Label("Quiz", systemImage: "questionmark.circle")
            }

            // 🌟 Rewards Tab
            NavigationView {
                RewardsView()
            }
            .tabItem {
                Label("Rewards", systemImage: "star")
            }

            // 👤 Profile Tab
            NavigationView {
                ProfileView()
            }
            .tabItem {
                Label("Profile", systemImage: "person")
            }
        }
    }
}
