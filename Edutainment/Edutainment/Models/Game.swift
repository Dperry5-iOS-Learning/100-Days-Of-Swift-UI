//
//  Game.swift
//  Edutainment
//
//  Created by Dylan Perry on 7/12/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import Foundation

final class Game: ObservableObject {
    
    public var questions: [Question]
    
    public let totalQuestions: Int
    
    @Published
    public var activeQuestion: Question
    
    @Published
    public var totalCorrect: Int = 0
    
    @Published
    public var totalAsked: Int = 0
    
    @Published
    public var questionsRemaining: Int = 0
    
    @Published
    public var isGameOver = false
    
    public init(questions: [Question]) {
        self.questions = questions
        self.activeQuestion = questions[0]
        self.questionsRemaining = questions.count
        self.totalQuestions = questions.count
    }
    
    public func checkAnswer(userAnswer: Int) -> Bool {
        return userAnswer == activeQuestion.answer
    }
    
    public func nextQuestion(gotLastOneCorrect: Bool) {
        if gotLastOneCorrect {
            self.totalCorrect += 1
        }
        
        self.questions.removeAll { $0 == activeQuestion }
        
        if self.questions.count == 0 {
            self.isGameOver = true
        } else {
            self.questionsRemaining = self.questions.count
            self.activeQuestion = self.questions[0]
        }
        

    }
}
