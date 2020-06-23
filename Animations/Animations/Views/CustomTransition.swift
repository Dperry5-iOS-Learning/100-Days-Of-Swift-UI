//
//  CustomTransition.swift
//  Animations
//
//  Created by Dylan Perry on 6/23/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI


struct CustomTransition {
    @State private var isShowingRed = false

}

extension CustomTransition {
    // Create View Modifer to rotate corners
    struct CornerRotateModifier: ViewModifier {
        let amount: Double
        let anchor: UnitPoint

        func body(content: Content) -> some View {
            content.rotationEffect(.degrees(amount), anchor: anchor).clipped()
        }
    }
}


extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CustomTransition.CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CustomTransition.CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}

extension CustomTransition: View {
    var body: some View {
        VStack {
            Button("Tap Me") {
               withAnimation {
                   self.isShowingRed.toggle()
               }            }
            if isShowingRed {
                // CUSTOM TRANSITION -- PIVOT
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .pivot))
                    // A different animation style for insertion and removal.
                    // PIVOT IS CUSTOM TRANSITION
            }
        }
    }
}

struct CustomTransition_Previews: PreviewProvider {
    static var previews: some View {
        CustomTransition()
    }
}
