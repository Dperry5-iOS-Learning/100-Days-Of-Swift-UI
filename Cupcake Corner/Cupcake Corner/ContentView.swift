//
//  ContentView.swift
//  Cupcake Corner
//
//  Created by Dylan Perry on 8/2/20.
//

import SwiftUI
struct ContentView {

    
}

extension ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: GetDataFromURLView()) {
                    Text("URL Session Data w/ Codable")
                }
                NavigationLink(destination: CupcakeCornerView() ){
                    Text("Cupcake Corner App")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
