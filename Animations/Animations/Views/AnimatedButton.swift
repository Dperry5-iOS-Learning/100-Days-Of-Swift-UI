//
//  Button.swift
//  Animations
//
//  Created by Dylan Perry on 6/23/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct AnimatedButton {
    @State private var animationAmount: CGFloat = 1

}

extension AnimatedButton: View {
    var body: some View {
        Button("Tap Me") {

        }
        .padding(40)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(Color.red)
                .scaleEffect(animationAmount)
                .opacity(Double(2 - animationAmount))
                .animation(
                    Animation.easeOut(duration: 1)
                        .repeatForever(autoreverses: false)
                )
        )
        .onAppear {
            self.animationAmount = 2
        }
    }
}

struct AnimatedButton_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedButton()
    }
}
