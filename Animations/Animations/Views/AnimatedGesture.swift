//
//  AnimatedGesture.swift
//  Animations
//
//  Created by Dylan Perry on 6/23/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct AnimatedGesture {
}


extension AnimatedGesture {
    struct LinearGradientGesture {
        @State private var dragAmount = CGSize.zero
    }
}

extension AnimatedGesture.LinearGradientGesture: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
        .frame(width: 300, height: 200)
        .clipShape(RoundedRectangle(cornerRadius: 10))
         .offset(dragAmount)
         .gesture(
             DragGesture()
                 .onChanged { self.dragAmount = $0.translation }
                 .onEnded { _ in
                     withAnimation(.spring()) {
                         self.dragAmount = .zero
                     }
                 }
         )
    }
}


extension AnimatedGesture {
    struct WordGesture {
        let letters = Array("Hello SwiftUI")
        @State private var enabled = false
        @State private var dragAmount = CGSize.zero
    }
}

extension AnimatedGesture.WordGesture: View {
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<letters.count) { num in
                Text(String(self.letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(self.enabled ? Color.blue : Color.red)
                    .offset(self.dragAmount)
                    .animation(Animation.default.delay(Double(num) / 20))
            }
        }
        .gesture(
            DragGesture()
                .onChanged { self.dragAmount = $0.translation }
                .onEnded { _ in
                    self.dragAmount = .zero
                    self.enabled.toggle()
                }
        )
    }

}


extension AnimatedGesture: View {
    var body: some View {
        WordGesture()
    }
}

struct AnimatedGesture_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedGesture()
    }
}
