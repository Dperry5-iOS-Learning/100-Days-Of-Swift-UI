//
//  ShowHideTransitions.swift
//  Animations
//
//  Created by Dylan Perry on 6/23/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct ShowHideTransitions {
    @State private var isShowingRed = false

}

extension ShowHideTransitions: View {
    var body: some View {
        VStack {
            Button("Tap Me") {
               withAnimation {
                   self.isShowingRed.toggle()
               }            }
            if isShowingRed {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
                    // A different animation style for insertion and removal.
            }
        }
    }
}

struct ShowHideTransitions_Previews: PreviewProvider {
    static var previews: some View {
        ShowHideTransitions()
    }
}
