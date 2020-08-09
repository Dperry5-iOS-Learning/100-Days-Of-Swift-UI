//
//  PushButton.swift
//  Bookworm
//
//  Created by Dylan Perry on 8/9/20.
//

import SwiftUI

struct PushButton {
    let title: String
    @Binding var isOn: Bool
    var onColors = [Color.red, Color.yellow]
    
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
}

extension PushButton: View {
    var body: some View {
        Button(title) {
            self.isOn.toggle()
        }
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: isOn ? onColors : offColors), startPoint: .top, endPoint: .bottom))
            .foregroundColor(.white)
            .clipShape(Capsule())
            .shadow(radius: isOn ? 0 : 5)
    }
}
