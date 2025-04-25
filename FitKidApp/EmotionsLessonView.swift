//
//  EmotionsLessonView.swift
//  FitKidApp
//
//  Created by Leslie Villalta on 4/24/25.
//

import SwiftUI

struct EmotionsLessonView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // Title
                Text("Emotions 101")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.fitOrange)

                // Intro
                Text("Emotions are feelings like happiness, sadness, anger, fear, and excitement. It's totally normal to feel different emotions — they help us understand what’s happening inside and around us!")
                    .font(.body)
                    .foregroundColor(.fitBlue)

                // Why Emotions Matter
                VStack(alignment: .leading, spacing: 12) {
                    Text("Why Do Emotions Matter?")
                        .font(.title2)
                        .foregroundColor(.fitOrange)
                        .bold()

                    Text("Emotions tell us what we need. If you're feeling lonely, maybe you need connection. If you're mad, something might feel unfair. Paying attention to emotions helps you make good choices and take care of yourself.")
                        .foregroundColor(.fitBlue)
                }

                // Common Emotions
                VStack(alignment: .leading, spacing: 12) {
                    Text("Common Emotions You Might Feel")
                        .font(.title2)
                        .foregroundColor(.fitOrange)
                        .bold()

                    Group {
                        Text("😊 **Happy** – When things go well or you’re doing something you love.")
                        Text("😢 **Sad** – When you’ve lost something or someone, or you’re feeling down.")
                        Text("😡 **Angry** – When something feels unfair or someone crosses a boundary.")
                        Text("😨 **Scared** – When something feels unsafe or unknown.")
                        Text("😌 **Calm** – When everything feels okay and peaceful.")
                    }
                    .foregroundColor(.fitBlue)
                }

                // Tip
                VStack(alignment: .leading, spacing: 10) {
                    Text("💡 Tip for Tough Moments")
                        .font(.headline)
                        .foregroundColor(.fitPeach)

                    Text("Try the 5-4-3-2-1 grounding exercise:")
                        .foregroundColor(.fitBlue)

                    Text("""
                        - 5 things you can see 👀  
                        - 4 things you can touch ✋  
                        - 3 things you can hear 👂  
                        - 2 things you can smell 👃  
                        - 1 thing you can taste 👅
                        """)
                        .font(.callout)
                        .foregroundColor(.fitBlue)
                        .padding(.top, 4)
                }
                .padding()
                .background(Color.fitPeach.opacity(0.2))
                .cornerRadius(10)

                // Reflection Section
                VStack(alignment: .leading, spacing: 12) {
                    Text("📝 Reflect")
                        .font(.title2)
                        .foregroundColor(.fitOrange)
                        .bold()

                    Text("Think about your day. What emotions did you feel? Can you name one moment where you noticed a strong feeling?")
                        .foregroundColor(.fitBlue)

                    Text("Try writing or drawing about it in a journal!")
                        .foregroundColor(.fitBlue)
                        .italic()
                }

                Spacer()
            }
            .padding()
        }
        .background(Color.fitMint.ignoresSafeArea())
        .navigationTitle("Emotions 101")
    }
}
