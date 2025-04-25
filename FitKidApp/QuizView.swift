//
//  QuizView.swift
//  FitKidApp
//
//  Created by Leslie Villalta on 4/24/25.
//

import SwiftUI

struct QuizQuestion {
    let question: String
    let answers: [String]
    let correctAnswer: String
}

struct QuizView: View {
    @State private var currentQuestionIndex = 0
    @State private var selectedAnswer: String? = nil
    @State private var showResult = false
    @State private var score = 0
    @State private var showBadge = false
    @State private var showDoneMessage = false
    
    @AppStorage("earnedHealthyHero") private var earnedHealthyHero = false
    @AppStorage("quizProgress") private var quizProgress: String = "Not Started"


    let questions: [QuizQuestion] = [
        QuizQuestion(
            question: "How many hours of sleep do kids need?",
            answers: ["5-6 hours", "7-8 hours", "9-11 hours", "12-14 hours"],
            correctAnswer: "9-11 hours"
        ),
        QuizQuestion(
            question: "What helps you feel calm when upset?",
            answers: ["Yelling", "Deep breaths", "Running away", "Breaking stuff"],
            correctAnswer: "Deep breaths"
        ),
        QuizQuestion(
            question: "How often should you brush your teeth?",
            answers: ["Once", "Twice", "Every other day", "Only after candy"],
            correctAnswer: "Twice"
        ),
        QuizQuestion(
            question: "What’s mindfulness?",
            answers: ["Being sleepy", "Being aware of now", "Overthinking", "Feeling confused"],
            correctAnswer: "Being aware of now"
        ),
        QuizQuestion(
            question: "Which food is best for strong bones?",
            answers: ["Candy", "Chips", "Cheese", "Soda"],
            correctAnswer: "Cheese"
        )
    ]

    var body: some View {
        ZStack {
            Color.fitMint.ignoresSafeArea()

            VStack(spacing: 20) {
                Text("Quiz Time!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.fitOrange)

                Text("Question \(currentQuestionIndex + 1) of \(questions.count)")
                    .font(.headline)
                    .foregroundColor(.fitBlue)

                Text(questions[currentQuestionIndex].question)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.fitBlue)
                    .padding()

                ForEach(questions[currentQuestionIndex].answers, id: \.self) { answer in
                    Button(action: {
                        if selectedAnswer == nil {
                            selectedAnswer = answer
                            showResult = true
                            quizProgress = "In Progress"
                            if answer == questions[currentQuestionIndex].correctAnswer {
                                score += 1
                            }
                        }
                    }) {
                        Text(answer)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(selectedAnswer == answer ? Color.gray : Color.fitWhite)
                            .foregroundColor(.fitOrange)
                            .cornerRadius(12)
                            .shadow(radius: 4)
                    }
                    .disabled(selectedAnswer != nil)
                }

                if showResult {
                    Text(selectedAnswer == questions[currentQuestionIndex].correctAnswer ? "✅ Correct!" : "❌ Try Again")
                        .font(.title3)
                        .foregroundColor(selectedAnswer == questions[currentQuestionIndex].correctAnswer ? .green : .red)
                        .padding(.top)

                    Button(action: {
                        if currentQuestionIndex + 1 < questions.count {
                            currentQuestionIndex += 1
                            selectedAnswer = nil
                            showResult = false
                        } else {
                            showBadge = true
                                //  Unlock badge if score qualifies
                            if score >= 4 {
                            earnedHealthyHero = true
                            }
                            quizProgress = "Completed"
                        }
                    }) {
                        Text(currentQuestionIndex + 1 < questions.count ? "Next Question" : "Finish Quiz")
                            .padding()
                            .background(Color.fitBlue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            }
            .padding()

            if showBadge {
                ZStack(alignment: .topTrailing) {
                    VStack {
                        Text("🎉 You finished the quiz!")
                            .font(.title)
                            .padding()

                        Text("🏅 You scored \(score) out of \(questions.count)!")
                            .font(.headline)
                            .padding(.bottom)

                        if score >= 4 {
                            NavigationLink(destination: RewardsView()) {
                                Text("🎖 You've earned the Health Hero Badge! Tap to view")
                                    .padding()
                                    .background(Color.fitWhite)
                                    .cornerRadius(12)
                                    .shadow(radius: 6)
                            }
                        } else {
                            Text("Keep practicing to earn the **Health Hero Badge!** 💪")
                                .font(.title3)
                                .padding()
                                .background(Color.fitWhite)
                                .cornerRadius(12)
                                .shadow(radius: 6)
                        }

                        HStack {
                            Button("Try Again?") {
                                resetQuiz()
                            }
                            .padding()
                            .background(Color.fitOrange)
                            .foregroundColor(.white)
                            .cornerRadius(10)

                            Button("Done") {
                                showBadge = false
                                showDoneMessage = true
                            }
                            .padding()
                            .background(Color.fitBlue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                        .padding(.top)
                    }
                    .padding()
                    .background(Color.fitMint.opacity(0.9))
                    .cornerRadius(20)
                    .shadow(radius: 10)

                    // ❌ Close button
                    Button(action: {
                        showBadge = false
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title)
                            .foregroundColor(.gray)
                            .padding()
                    }
                }
            }

            if showDoneMessage {
                VStack {
                    Spacer()
                    Text("🎉 Great! You're done for the day!")
                        .font(.title2)
                        .padding()
                        .background(Color.fitWhite)
                        .cornerRadius(12)
                        .shadow(radius: 8)
                    Spacer()
                }
                .transition(.scale)
            }
        }
        .navigationTitle("Quiz")
    }

    private func resetQuiz() {
        currentQuestionIndex = 0
        selectedAnswer = nil
        showResult = false
        score = 0
        showBadge = false
        showDoneMessage = false
    }
}
