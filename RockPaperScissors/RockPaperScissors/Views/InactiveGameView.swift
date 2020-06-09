//
//  InactiveGameView.swift
//  RockPaperScissors
//
//  Created by Dylan Perry on 6/9/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct InactiveGameView {
    @Binding var highScore: Int
    @Binding var isGameActive: Bool
}

extension InactiveGameView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Game Over")
                .titleStyle()
            Spacer()
            Text("Your Score: \(highScore)")
            Spacer()
            Button(action: {
                self.isGameActive = true
            }) {
                Text("Play Again")
            }
            Spacer()
        }
    }
}

struct InactiveGameView_Previews: PreviewProvider {
    static var previews: some View {
        InactiveGameView(highScore: .constant(0), isGameActive: .constant(false))
    }
}
