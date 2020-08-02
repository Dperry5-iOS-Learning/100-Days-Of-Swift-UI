//
//  BordersAndFills.swift
//  Drawing
//
//  Created by Dylan Perry on 8/1/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct BordersAndFills: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Hello World")
                    .frame(width: 300, height: 300)
                    .background(Color.red)
                
                Text("Hello World")
                    .frame(width: 300, height: 300)
                    .border(Color.red, width: 30)
                
                Text("Hello World")
                    .frame(width: 300, height: 300)
                    .background(Image(systemName: "car"))
            }
        }
    }
}

struct BordersAndFills_Previews: PreviewProvider {
    static var previews: some View {
        BordersAndFills()
    }
}
