//
//  ContentView.swift
//  Animations
//
//  Created by Dylan Perry on 6/23/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct ContentView {
    @State private var animationAmount: CGFloat = 1

}


extension ContentView: View {
    var body: some View {
        CustomTransition()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
