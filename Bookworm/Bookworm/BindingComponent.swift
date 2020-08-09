//
//  BindingComponent.swift
//  Bookworm
//
//  Created by Dylan Perry on 8/9/20.
//

import SwiftUI

struct BindingComponent {
    @State private var rememberMe = false
}

extension BindingComponent: View {
    var body: some View {
        VStack {
            PushButton(title: "Remember Me", isOn: $rememberMe)
            Text(rememberMe ? "On" : "Off")
        }
    }
}

struct BindingComponent_Previews: PreviewProvider {
    static var previews: some View {
        BindingComponent()
    }
}
