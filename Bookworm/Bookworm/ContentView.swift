//
//  ContentView.swift
//  Bookworm
//
//  Created by Dylan Perry on 8/9/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(
                    destination: ExampleView(),
                    label: {
                        Text("Examples")
                    }
                )
                
                NavigationLink(
                    destination: Bookworm(),
                    label: {
                        Text("Start App")
                    })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
