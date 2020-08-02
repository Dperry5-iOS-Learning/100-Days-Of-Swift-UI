//
//  CGAffineTransformView.swift
//  Drawing
//
//  Created by Dylan Perry on 8/1/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct CGAffineTransformView {
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0
}

extension CGAffineTransformView: View {
    var body: some View {
        VStack {
            Flower(petalOffset: petalOffset, petalWidth: petalWidth)
                .fill(Color.red, style: FillStyle(eoFill: true))


            Text("Offset")
            Slider(value: $petalOffset, in: -40...40)
                .padding([.horizontal, .bottom])

            Text("Width")
            Slider(value: $petalWidth, in: 0...100)
                .padding(.horizontal)
        }
    }
}

struct CGAffineTransformView_Previews: PreviewProvider {
    static var previews: some View {
        CGAffineTransformView()
    }
}
