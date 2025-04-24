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
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            LessonsView()
                .tabItem {
                    Label("Lessons", systemImage: "book")
                }
            HabitTrackerView()
                .tabItem {
                    Label("Habits", systemImage: "checkmark.circle")
                }
            RewardsView()
                .tabItem {
                    Label("Rewards", systemImage: "star")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}
