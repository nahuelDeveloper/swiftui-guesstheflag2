//
//  ContentView.swift
//  swiftui-guesstheflag2
//
//  Created by Nahuel Jose Roldan on 24/03/2024.
//

import SwiftUI

struct ContentView: View {
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"]
    var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of:")
                    Text(countries[correctAnswer])
                }
                .foregroundStyle(.white)
                
                ForEach(0..<3) { number in
                    Button(action: {
                        // tap action
                    }, label: {
                        Image(countries[number])
                    })
                }
            }
        }
    }
    
    
}

#Preview {
    ContentView()
}
