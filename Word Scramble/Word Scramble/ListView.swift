//
//  ListView.swift
//  Word Scramble
//
//  Created by Dylan Perry on 6/22/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct ListView {
    let people = ["Finn", "Leia", "Luke", "Rey"]

}

extension ListView: View {
    var body: some View {
        List {
            Section(header: Text("Section 1")) {
                Text("Static row 1")
                Text("Static row 2")
            }

            Section(header: Text("Section 2")) {
                ForEach(0..<5) {
                    Text("Dynamic row \($0)")
                }
            }

            Section(header: Text("Section 3")) {
                Text("Static row 3")
                Text("Static row 4")
            }
            Section(header: Text("Section 4")){
                
                ForEach(people, id: \.self) {
                    Text($0)
                }
            }
        }
        .listStyle(GroupedListStyle())

    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
