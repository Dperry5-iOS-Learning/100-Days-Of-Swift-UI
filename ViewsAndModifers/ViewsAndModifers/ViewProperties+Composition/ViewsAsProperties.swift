//
//  ViewsAsProperties.swift
//  ViewsAndModifers
//
//  Created by Dylan Perry on 6/8/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct ViewsAsProperties {
    let motto1 = Text("Draco dormiens")
    let motto2 = Text("nunquam titillandus")
    var computedMotto3: some View { Text("Draco dormiens") }

}

extension ViewsAsProperties: View {
    public var body: some View {
        VStack {
            motto1
                .foregroundColor(.green)
            motto2
                .foregroundColor(.red)
            computedMotto3
                .foregroundColor(.purple)
        }
    }
}

struct ViewsAsProperties_Previews: PreviewProvider {
    static var previews: some View {
        ViewsAsProperties()
    }
}
