//
//  AnimationView.swift
//  Drawing
//
//  Created by Dylan Perry on 8/1/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct AnimationView {
    @State
    private var insetAmount: CGFloat = 50

}

extension AnimationView: View {
    var body: some View {
        Trapezoid(insetAmount: insetAmount)
            .frame(width: 200, height: 100)
            .onTapGesture {
                withAnimation {
                    self.insetAmount = CGFloat.random(in: 10...90)
                }
            }
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
