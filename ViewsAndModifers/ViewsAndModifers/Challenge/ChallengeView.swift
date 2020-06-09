//
//  ChallengeView.swift
//  ViewsAndModifers
//
//  Created by Dylan Perry on 6/9/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct ChallengeView {}

extension ChallengeView {
    struct TitleText: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.largeTitle)
                .foregroundColor(.blue)
                .padding()
        }
    }
}

extension View {
    func titleText() -> some View {
        self.modifier(ChallengeView.TitleText())
    }
}

extension ChallengeView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        .titleText()
    }
}

struct ChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeView()
    }
}
