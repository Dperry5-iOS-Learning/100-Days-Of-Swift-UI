//
//  ContentView.swift
//  Drawing
//
//  Created by Dylan Perry on 8/1/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: ExampleView()){
                    Text("Examples")
                }
                NavigationLink(destination: MainAppView()){
                    Text("Main App")
                }
            }
             .navigationBarTitle(Text("Drawing App"), displayMode: .inline)
        }
    }
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
