//
//  QuestionCard.swift
//  Edutainment
//
//  Created by Dylan Perry on 7/12/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct QuestionCard {
    @ObservedObject
    private var game: Game
    
    @State
    private var answer: String = ""
    
    @State
    private var gotAnswerCorrect = false
    
    @State
    private var showModal = false
    
    public init(game: Game){
        self.game = game
    }
}

extension QuestionCard: View {
    var body: some View {
        Form {
            Section(header: Text("The Question")){
                Text("\(self.$game.activeQuestion.wrappedValue.valueOne) x \(self.$game.activeQuestion.wrappedValue.valueTwo)")
            }
            Section(header: Text("Your Answer")){
                TextField("Answer the Problem...", text: $answer)
            }
            
            Section {
                Button("Submit Answer") {
                    self.gotAnswerCorrect = self.game.checkAnswer(userAnswer: Int(self.answer)!)
                    self.showModal.toggle()
                }
            }
        }
        .alert(isPresented: $showModal) {
        
            Alert(title: Text("Ready for the next question?"), message:  Text(self.gotAnswerCorrect ? "You got the last question right!" : "You got the last question wrong!"), dismissButton: .default(Text("Next Question"), action: {
                self.game.nextQuestion(gotLastOneCorrect: self.gotAnswerCorrect)
                self.showModal = false
            }))
        }
    }
}

