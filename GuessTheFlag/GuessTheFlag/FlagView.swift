//
//  FlagView.swift
//  GuessTheFlag
//
//  Created by Dylan Perry on 6/9/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI
struct FlagView {
    public var country: String
}
extension FlagView: View {
    var body: some View {
        Image(country)
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
            .shadow(color: .black, radius: 2)
    }
}

struct FlagView_Previews: PreviewProvider {
    static var previews: some View {
        FlagView(country: "US")
    }
}
