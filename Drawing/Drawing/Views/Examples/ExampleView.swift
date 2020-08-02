//
//  ExampleView.swift
//  Drawing
//
//  Created by Dylan Perry on 8/1/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct ExampleView: View {
    var body: some View {
        List {
            NavigationLink(destination: ShapeAndPathsView()) {
                Text("Shapes and Paths")
            }
            NavigationLink(destination: SBAndISSView()) {
                Text("Stroke Border and Insettable Shapes")
            }
            NavigationLink(destination: CGAffineTransformView()) {
                Text("CG Affine Transform View")
            }
            NavigationLink(destination: BordersAndFills()) {
                Text("Borders and Fills")
            }
            NavigationLink(destination: MetalView()) {
                Text("Metal")
            }
            NavigationLink(destination: SpecialEffectsView()) {
                  Text("Special Effects")
              }
            NavigationLink(destination: AnimationView()) {
                  Text("Animation")
              }
            
            NavigationLink(destination: AnimatablePairView()) {
                  Text("Animatable Pair")
              }
            
            NavigationLink(destination: SpirographView()) {
                  Text("Spirograph")
              }
            

            
        }
    .navigationBarTitle("Examples")
    }
}

struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}
