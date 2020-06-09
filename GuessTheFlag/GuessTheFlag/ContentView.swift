//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Dylan Perry on 6/3/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct ContentView {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    
    @State private var scoreTitle = ""
    
    @State private var score = 0
}

extension ContentView {
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct! You really know your flags!"
            score += 1
        } else {
            scoreTitle = "Annnkkkkk - That's the flag of \(countries[number])"
        }

        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

extension ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)

            VStack(spacing: 20) {
                VStack {
                    HStack {
                         Spacer()
                     }
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    
                    //
                    Text(countries[correctAnswer])
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .fixedSize(horizontal: false, vertical: true)
                }
                
                ForEach(0 ..< 3) { number in
                    Button(action: {
                       // flag was tapped
                        self.flagTapped(number)

                    }) {
                        FlagView(country: self.countries[number])
                    }
                }
                Spacer()
                Text("Current Score: \(score)")
                    .foregroundColor(.gray)
                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
