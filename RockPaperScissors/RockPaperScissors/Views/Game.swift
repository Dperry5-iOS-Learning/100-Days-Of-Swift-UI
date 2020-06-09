//
//  Game.swift
//  RockPaperScissors
//
//  Created by Dylan Perry on 6/9/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct Game {
    var gameChoice: String
    @Binding var gameGoal: Bool
}

extension Game: View {
    var body: some View {
        HStack{
            Spacer()
            VStack{
                Text("The Game Chose:")
                    .foregroundColor(.white)
                Text(gameChoice)
                    .titleStyle()
            }
            Spacer()
            VStack{
                Text("Your Goal is to: ")
                    .foregroundColor(.white)
                Text(gameGoal ? "Win": "Lose")
                    .titleStyle()
            }
            Spacer()
        }
        .padding()
        .background(Color(.blue))
    }
}

struct Game_Previews: PreviewProvider {
    static var previews: some View {
        Game(gameChoice: "Rock", gameGoal: .constant(false))
    }
}
