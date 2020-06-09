//
//  GameModel.swift
//  RockPaperScissors
//
//  Created by Dylan Perry on 6/9/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import Foundation

struct GameModel {
    func didPlayerWin(playerChoice: Int, gameChoice: Int, shouldPlayerWin: Bool) -> Bool {
        if shouldPlayerWin {
            if gameChoice < 2 {
                return playerChoice == (gameChoice + 1)
            } else {
                return playerChoice == 0
            }
        } else {
            if gameChoice > 0 {
                return playerChoice == (gameChoice - 1)
            } else {
                return playerChoice == 2
            }
        }
    }
}
