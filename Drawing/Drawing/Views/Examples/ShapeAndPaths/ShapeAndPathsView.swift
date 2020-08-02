//
//  ShapeAndPathsView.swift
//  Drawing
//
//  Created by Dylan Perry on 8/1/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct ShapeAndPathsView: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 10){
                // Draw a Triangle
                Path { path in
                    // Move Path to starting point
                    path.move(to: CGPoint(x: 200, y: 100))
                    // Draw a Triangle
                    path.addLine(to: CGPoint(x: 100, y: 300))
                    path.addLine(to: CGPoint(x: 300, y: 300))
                    path.addLine(to: CGPoint(x: 200, y: 100))
                }
                    // Use .fill to fill it in, or .stroke to only show the lines we drew with path.
                    // Use Stroke Style to make it all connect
                .stroke(Color.green, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                
                Triangle()
                .stroke(Color.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .frame(width: 300, height: 300)
                .padding()
                
                Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
                .stroke(Color.blue, lineWidth: 10)
                .frame(width: 300, height: 300)
            }
            .frame(minHeight: 1000, maxHeight: .infinity)
        }
        .navigationBarTitle(Text("Shapes and Paths"))
    }
}

struct ShapeAndPathsView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeAndPathsView()
    }
}
