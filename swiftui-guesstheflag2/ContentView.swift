//
//  ContentView.swift
//  swiftui-guesstheflag2
//
//  Created by Nahuel Jose Roldan on 24/03/2024.
//

import SwiftUI

let totalAttempts = 3

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var attemptsLeft = totalAttempts
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of:")
                        .font(.subheadline.weight(.heavy))
                    Text(countries[correctAnswer])
                        .font(.largeTitle.weight(.semibold))
                }
                .foregroundStyle(.white)
                
                ForEach(0..<3) { number in
                    Button(action: {
                        flagTapped(number)
                    }, label: {
                        Image(countries[number])
                            .clipShape(.capsule)
                            .shadow(radius: 5)
                    })
                }
                
                VStack {
                    Text("Your score is:")
                        .font(.subheadline.weight(.heavy))
                    Text("\(score)")
                        .font(.largeTitle.weight(.semibold))
                }
                .foregroundStyle(.white)
            }
        }.alert(scoreTitle, isPresented: $showingScore) {
            attemptsLeft > 0 ? Button("Continue", action: askQuestion) : Button("Restart", action: restartGame)
        } message: {
            Text(attemptsLeft > 0 ? "Your score is \(score)" : "")
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 100
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])"
            score -= 50
        }
        
        attemptsLeft -= 1
        if attemptsLeft == 0 {
            scoreTitle = "Your total score is: \(score)\n Game over"
        }
        
        showingScore = true
    }
    
    func restartGame() {
        attemptsLeft = totalAttempts
        score = 0
        askQuestion()
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
