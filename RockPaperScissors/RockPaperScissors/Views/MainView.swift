//
//  MainView.swift
//  RockPaperScissors
//
//  Created by Dylan Perry on 6/9/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct MainView {
    @State var isActiveGame = false
    @State var highScore = 0
}


extension MainView: View {
    @ViewBuilder
    var body: some View {
        if isActiveGame {
            RockPaperScissorsView(playerScore: $highScore, isGameActive: $isActiveGame)
        } else {
            InactiveGameView(highScore: $highScore, isGameActive: $isActiveGame)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
