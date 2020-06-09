//
//  CustomViewModifers.swift
//  ViewsAndModifers
//
//  Created by Dylan Perry on 6/8/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct CustomViewModifers {
    
}

// Create the ViewModifer for Title
extension CustomViewModifers {
    struct Title: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
                .background(Color.orange)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

// Create the View Modifer for Watermark

extension CustomViewModifers {
    struct Watermark: ViewModifier {
        var text: String

        func body(content: Content) -> some View {
            ZStack(alignment: .bottomTrailing) {
                content
                Text(text)
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(5)
                    .background(Color.black)
            }
        }
    }
}

// Extend View
extension View {
    func titleStyle() -> some View {
        self.modifier(CustomViewModifers.Title())
    }
    
    func watermarked(with text: String) -> some View {
        self.modifier(CustomViewModifers.Watermark(text: text))
    }
}


extension CustomViewModifers: View {
    var body: some View {
        ZStack{
            Color.blue
            .frame(width: 300, height: 200)
            .watermarked(with: "Hacking with Swift")
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .titleStyle()
        }
        
    }
}

struct CustomViewModifers_Previews: PreviewProvider {
    static var previews: some View {
        CustomViewModifers()
    }
}
