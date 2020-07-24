//
//  MultiplicationGame.swift
//  Edutainment
//
//  Created by Dylan Perry on 7/11/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct MultiplicationGame {
    private let multiplicationMax: Int
    
    @ObservedObject
    private var game: Game
    
    public init(multiplicationMax: Int, numberOfQuestions: String) {
        self.multiplicationMax = multiplicationMax
        var numberOfQuestionsAsInt: Int = 0
        if numberOfQuestions == "All" {
            numberOfQuestionsAsInt = multiplicationMax * multiplicationMax
        } else {
            numberOfQuestionsAsInt = Int(numberOfQuestions)!
        }
        
        var questions: [Question] = []
        
        while questions.count < numberOfQuestionsAsInt {
            let valueOne = Int.random(in: 0...multiplicationMax)
            let valueTwo = Int.random(in: 0...multiplicationMax)
            
            let question = Question(valueOne: valueOne, valueTwo: valueTwo)
            let doesQuestionExist = questions.contains{ $0 == question}
            
            if doesQuestionExist {
                break
            }
            questions.append(question)
        }
        
        self.game = Game(questions: questions)
        
    }
}

extension MultiplicationGame: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            Scoreboard(game: self.game)
                .padding()
            
            Divider()
                
            QuestionCard(game: self.game)

        }
        .sheet(isPresented: self.$game.isGameOver, content: {
            VStack {
                Text("Good Work!")
                Text("You got \(self.$game.totalCorrect.wrappedValue) out of \(self.game.totalQuestions) right!")
            }
        })
        .navigationBarTitle(Text("Multiplication Game"), displayMode: .inline)

    }
}

struct MultiplicationGame_Previews: PreviewProvider {
    static var previews: some View {
        MultiplicationGame(multiplicationMax: 5, numberOfQuestions: "All")
    }
}
