//
//  SpecialEffectsView.swift
//  Drawing
//
//  Created by Dylan Perry on 8/1/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct SpecialEffectsView: View {
    var body: some View {
        Image(systemName: "car")
            .colorMultiply(.red)
        
    }
}

struct SpecialEffectsView_Previews: PreviewProvider {
    static var previews: some View {
        SpecialEffectsView()
    }
}
