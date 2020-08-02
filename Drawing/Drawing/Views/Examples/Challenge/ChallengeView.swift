//
//  ChallengeView.swift
//  Drawing
//
//  Created by Dylan Perry on 8/1/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct ChallengeView: View {
    var body: some View {
        Arrow()
        .stroke(lineWidth: 20)
        .padding()
    }
}

struct ChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeView()
    }
}
