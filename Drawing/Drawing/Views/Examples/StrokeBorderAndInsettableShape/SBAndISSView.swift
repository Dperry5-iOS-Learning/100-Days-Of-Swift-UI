//
//  SBAndISSView.swift
//  Drawing
//
//  Created by Dylan Perry on 8/1/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct SBAndISSView: View {
    var body: some View {
        VStack{
             Circle()
                .stroke(Color.red, lineWidth: 10)
                .padding()
            
                
            Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
            .strokeBorder(Color.blue, lineWidth: 40)
        }
    }
}

struct SBAndISSView_Previews: PreviewProvider {
    static var previews: some View {
        SBAndISSView()
    }
}
