//
//  HabitTrackerView.swift
//  FitKidApp
//
//  Created by Leslie Villalta on 4/23/25.
//

import SwiftUI

struct Habit: Identifiable, Hashable, Codable {
    let id: UUID
    var name: String
    var isCompleted: Bool

    init(id: UUID = UUID(), name: String, isCompleted: Bool = false) {
        self.id = id
        self.name = name
        self.isCompleted = isCompleted
    }
}

struct HabitTrackerView: View {
    @AppStorage("habitCompletion") private var habitCompletionData: Data?

    @State private var defaultHabits: [Habit] = [
        Habit(name: "Drank Water"),
        Habit(name: "Brushed Teeth"),
        Habit(name: "Wrote in Journal")
    ]

    @State private var customHabits: [Habit] = []
    @State private var newHabitName = ""
    @State private var journalText = ""
    @State private var showHome = false

    var allHabitsCompleted: Bool {
        let allDefaultsComplete = defaultHabits.allSatisfy { $0.isCompleted }
        let allCustomsComplete = customHabits.allSatisfy { $0.isCompleted }
        let journalComplete = defaultHabits.first(where: { $0.name == "Wrote in Journal" })?.isCompleted == false || !journalText.isEmpty
        return allDefaultsComplete && allCustomsComplete && journalComplete
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color.fitMint.ignoresSafeArea()

                VStack(spacing: 20) {
                    Form {
                        Section(header: Text("Track your habits")
                            .foregroundColor(.fitBlue)
                        ) {
                            ForEach($defaultHabits) { $habit in
                                Toggle(isOn: $habit.isCompleted) {
                                    Label(habit.name, systemImage: icon(for: habit.name))
                                }
                                if habit.name == "Wrote in Journal" && habit.isCompleted {
                                    TextField("What did you write in your journal?", text: $journalText)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .padding(.top, 5)
                                }
                            }

                            Section(header: Text("Your Custom Habits")) {
                                ForEach($customHabits) { $habit in
                                    Toggle(isOn: $habit.isCompleted) {
                                        Text(habit.name)
                                    }
                                }
                                .onDelete(perform: deleteCustomHabit)
                            }

                            HStack {
                                TextField("Add your own habit", text: $newHabitName)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                Button(action: {
                                    if !newHabitName.isEmpty {
                                        customHabits.append(Habit(name: newHabitName))
                                        newHabitName = ""
                                        updateHabitCompletion()
                                    }
                                }) {
                                    Image(systemName: "plus.circle.fill")
                                        .font(.title2)
                                        .foregroundColor(.fitOrange)
                                }
                                .disabled(newHabitName.trimmingCharacters(in: .whitespaces).isEmpty)
                            }
                            .padding(.vertical, 4)
                        }
                        .listRowBackground(Color.fitWhite)
                    }
                    .scrollContentBackground(.hidden)

                    if allHabitsCompleted {
                        Button {
                            showHome = true
                        } label: {
                            Text("🎉 Congrats! You completed all your habits today! Tap to go Home")
                                .font(.title2)
                                .foregroundColor(.fitBlue)
                                .padding()
                                .background(Color.fitOrange)
                                .cornerRadius(12)
                                .shadow(radius: 4)
                                .padding(.bottom)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .navigationTitle("Daily Habits")
                .onChange(of: defaultHabits) {
                    updateHabitCompletion()
                }
                .onChange(of: customHabits) {
                    updateHabitCompletion()
                }
                .onChange(of: journalText) {
                    updateHabitCompletion()
                }
                .onAppear {
                    updateHabitCompletion()
                }
                .navigationDestination(isPresented: $showHome) {
                    HomeView()
                }
            }
        }
    }

    private func icon(for habitName: String) -> String {
        switch habitName {
        case "Drank Water": return "drop.fill"
        case "Brushed Teeth": return "mouth.fill"
        case "Wrote in Journal": return "book.closed.fill"
        default: return "checkmark.circle"
        }
    }

    private func deleteCustomHabit(at offsets: IndexSet) {
        customHabits.remove(atOffsets: offsets)
        updateHabitCompletion()
    }

    private func updateHabitCompletion() {
        if allHabitsCompleted {
            habitCompletionData = try? JSONEncoder().encode(["completed": true])
            showHome = true
        }
    }
}
