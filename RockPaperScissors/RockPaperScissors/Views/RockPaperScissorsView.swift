//
//  RockPaperScissorsView.swift
//  RockPaperScissors
//
//  Created by Dylan Perry on 6/9/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct RockPaperScissorsView {
    let options = ["Rock", "Paper", "Scissors"]
    let maxRounds = 10
    private let gameModel = GameModel()
    
    @Binding var playerScore: Int
    @Binding var isGameActive: Bool
   
    
    @State private var gameChoice: Int = 0
    @State private var shouldPlayerWin: Bool = true
    @State private var totalRounds = 1
    
}

extension RockPaperScissorsView {
    func handlePlayerAnswer(playerChoice: Int){
                
        totalRounds += 1
        
        let didPlayerWin = gameModel.didPlayerWin(playerChoice: playerChoice, gameChoice: gameChoice, shouldPlayerWin: shouldPlayerWin)
        
        if didPlayerWin {
            print("Player won")
            playerScore += 1
        } else {
            print("Player Lost")
            playerScore -= 1
        }
        
        if totalRounds <= maxRounds {
            gameChoice = Int.random(in: 0..<options.count)
            shouldPlayerWin = Bool.random()
        } else {
            print("Game Over")
            isGameActive = false
        }
    }
}

extension RockPaperScissorsView: View {
    var body: some View {
        ZStack{
            Color(.blue)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                Text("Rock, Paper, Scissors!")
                .titleStyle()
                
                Spacer()
                
                Game(gameChoice: options[gameChoice], gameGoal: $shouldPlayerWin)
                
                Spacer()
                VStack{
                    
                    Text("Pick One")
                        .foregroundColor(.white)
                        .padding()
                    
                    PlayerOptions(options: options, action: handlePlayerAnswer)
                }
                Spacer()                
            }
        }
    }
}

struct RockPaperScissorsView_Previews: PreviewProvider {
    static var previews: some View {
        RockPaperScissorsView(playerScore: .constant(2), isGameActive: .constant(false))
    }
}
