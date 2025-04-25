//
//  PubertyBasicsView.swift
//  FitKidApp
//
//  Created by Leslie Villalta on 4/24/25.
//

import SwiftUI

struct PubertyBasicsLessonView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // Title
                Text("Puberty Basics")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.fitOrange)

                // Intro
                Text("Puberty is a time when your body begins to grow and change into an adult body. It's different for everyone and totally normal to have questions!")
                    .font(.body)
                    .foregroundColor(.fitBlue)

                // Section 1: Body Changes
                VStack(alignment: .leading, spacing: 12) {
                    Text("🌱 Body Changes")
                        .font(.title2)
                        .foregroundColor(.fitOrange)
                        .bold()

                    Text("During puberty, your body may grow taller, your voice might change, and you may notice hair growing in new places. This is all a natural part of growing up.")
                        .foregroundColor(.fitBlue)
                }

                // Section 2: Emotional Changes
                VStack(alignment: .leading, spacing: 12) {
                    Text("💭 Emotional Changes")
                        .font(.title2)
                        .foregroundColor(.fitOrange)
                        .bold()

                    Text("You might feel more emotional or notice your feelings changing quickly. This happens because of new hormones in your body. Talking about your feelings helps!")
                        .foregroundColor(.fitBlue)
                }

                // Section 3: Hygiene Tips
                VStack(alignment: .leading, spacing: 12) {
                    Text("🧼 Hygiene Tips")
                        .font(.title2)
                        .foregroundColor(.fitOrange)
                        .bold()

                    Text("As your body changes, it's extra important to stay clean. Shower regularly, wear deodorant, and take care of your skin and teeth.")
                        .foregroundColor(.fitBlue)
                }

                // Fun Fact
                VStack(alignment: .leading, spacing: 10) {
                    Text("🤓 Fun Fact")
                        .font(.headline)
                        .foregroundColor(.fitPeach)

                    Text("Everyone goes through puberty at their own pace — there's no 'right' time to start or finish.")
                        .foregroundColor(.fitBlue)
                }
                .padding()
                .background(Color.fitPeach.opacity(0.2))
                .cornerRadius(10)

                // Encouragement
                VStack(alignment: .leading, spacing: 12) {
                    Text("💬 You’re Not Alone")
                        .font(.title2)
                        .foregroundColor(.fitOrange)
                        .bold()

                    Text("If you're ever confused, scared, or just curious — talk to a trusted adult, like a parent, teacher, or doctor. Your questions are important!")
                        .foregroundColor(.fitBlue)
                }

                Spacer()
            }
            .padding()
        }
        .background(Color.fitMint.ignoresSafeArea())
        .navigationTitle("Puberty Basics")
    }
}
