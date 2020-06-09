//
//  HarryPotterVStack.swift
//  ViewsAndModifers
//
//  Created by Dylan Perry on 6/8/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct HarryPotterVStack: View {
    var body: some View {
        VStack {
            //Here, font() is an environment modifier, which means the Gryffindor text view can override it with a custom font.
            Text("Slytherin")
                .font(.largeTitle)
                .blur(radius: 0)
            Text("Hufflepuff")
            Text("Ravenclaw")
            Text("Gryffindor")
        }
        .font(.title)
        //That won’t work the same way: blur() is a regular modifier, so any blurs applied to child views are added to the VStack blur rather than replacing it.
        .blur(radius: 5)
    }
}

struct HarryPotterVStack_Previews: PreviewProvider {
    static var previews: some View {
        HarryPotterVStack()
    }
}
