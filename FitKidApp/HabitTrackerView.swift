//
//  HabitTrackerView.swift
//  FitKidApp
//
//  Created by Leslie Villalta on 4/23/25.
//

import SwiftUI

struct HabitTrackerView: View {
    @State private var drankWater = false
    @State private var brushedTeeth = false
    @State private var journaled = false

    var body: some View {
        ZStack {
            Color.fitMint.ignoresSafeArea() // background

            Form {
                Section(header: Text("Track your habits")
                    .foregroundColor(.fitBlue)
                ) {
                    Toggle(isOn: $drankWater) {
                        Label("Drank Water", systemImage: "drop.fill")
                    }
                    Toggle(isOn: $brushedTeeth) {
                        Label("Brushed Teeth", systemImage: "mouth.fill")
                    }
                    Toggle(isOn: $journaled) {
                        Label("Wrote in Journal", systemImage: "book.closed.fill")
                    }
                }
                .listRowBackground(Color.fitWhite)
            }
            .scrollContentBackground(.hidden) // Removes default form background
            .navigationTitle("Daily Habits")
        }
    }
}
