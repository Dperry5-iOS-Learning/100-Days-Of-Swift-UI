//
//  AnimatedBindings.swift
//  Animations
//
//  Created by Dylan Perry on 6/23/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct AnimatedBindings {
    @State private var animationAmount: CGFloat = 1
}

extension AnimatedBindings: View {
    var body: some View {
        VStack {
            Stepper("Scale amount", value: $animationAmount.animation(
                Animation.easeInOut(duration: 1)
                    .repeatCount(3, autoreverses: true)
            ), in: 1...10)

            Spacer()

            Button("Tap Me") {
                self.animationAmount += 1
            }
            .padding(40)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
        }
    }
}

struct AnimatedBindings_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedBindings()
    }
}
