//
//  Scoreboard.swift
//  Edutainment
//
//  Created by Dylan Perry on 7/12/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct Scoreboard {
    @ObservedObject
    private var game: Game
    
    public init(game: Game){
        self.game = game
    }
    
}

extension Scoreboard: View {
    var body: some View {
        HStack {
            Text("Questions Correct: \($game.totalCorrect.wrappedValue)")
                .font(.footnote)
            Spacer()
            Text("Questions Remaining: \($game.questionsRemaining.wrappedValue)")
                .font(.footnote)
        }
    }
}

