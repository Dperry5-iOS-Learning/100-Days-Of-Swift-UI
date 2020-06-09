//
//  PlayerOptionsStyle.swift
//  RockPaperScissors
//
//  Created by Dylan Perry on 6/9/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct PlayerOptionsStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .background(Color.orange)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func optionStyle() -> some View {
        self.modifier(PlayerOptionsStyle())
    }
}
