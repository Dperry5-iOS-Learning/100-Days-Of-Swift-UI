//
//  ContentView.swift
//  ViewsAndModifers
//
//  Created by Dylan Perry on 6/8/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI


struct ContentView {
    @State private var useGreenText = false
}

/*
 Returning some View has two important differences compared to just returning View:

 We must always return the same type of view.
 Even though we don’t know what view type is going back, the compiler does.
 The first difference is important for performance: SwiftUI needs to be able to look at the views we are showing and understand how they change, so it can correctly update the user interface. If we were allowed to change views randomly, it would be really slow for SwiftUI to figure out exactly what changed – it would pretty much need to ditch everything and start again after every small change.
 
 
 If we want to return one of those from our body property, what should we write? While you could try to figure out the exact combination of ModifiedContent generics, it’s hideously painful and the simple truth is that we don’t care: it’s all internal SwiftUI stuff.

 What some View lets us do is say “this will return one specific type of view, such as Button or Text, but I don’t want to say what.” So, the hole that View has will be filled by a real view, but we aren’t required to write out the exact long type.
 */

extension ContentView: View {
    var body: some View {
//        Text("Hello, World!")
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(Color(.red))
//        .edgesIgnoringSafeArea(.all)
        /**
         
         two things here:

         Every time we modify a view SwiftUI applies that modifier by using generics: ModifiedContent<OurThing, OurModifier>.
         When we apply multiple modifiers, they just stack up: ModifiedContent<ModifiedContent<…
         To read what the type is, start from the innermost type and work your way out:

         The innermost type is ModifiedContent<Button<Text>, _BackgroundModifier<Color>: our button has some text with a background color applied.
         Around that we have ModifiedContent<…, _FrameLayout>, which takes our first view (button + background color) and gives it a larger frame.
         
         Can use padding more than once.
         
         */
        Button("Hello World"){
            print(type(of: self.body))
            self.useGreenText.toggle()
        }
        .foregroundColor(useGreenText ? .green : .blue)

        .frame(width: 200, height: 200)
        .background(Color.red)
        .padding()
        .background(Color.blue)
        .padding()
        .background(Color.green)
        .padding()
        .background(Color.yellow)

        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
