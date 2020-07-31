//
//  ScrollViewExample.swift
//  Moonshot
//
//  Created by Dylan Perry on 7/31/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct ScrollViewExample: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 10) {
                ForEach(0..<100) {
                    Text("Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct ScrollViewExample_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewExample()
    }
}
