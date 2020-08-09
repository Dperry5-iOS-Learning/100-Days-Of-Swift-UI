//
//  ExampleView.swift
//  Bookworm
//
//  Created by Dylan Perry on 8/9/20.
//

import SwiftUI

struct ExampleView: View {
    var body: some View {
        List {
            NavigationLink(
                destination: BindingComponent(),
                label: {
                    Text("Binding Component")
                }
            )
            NavigationLink(
                destination: SizeClassView(),
                label: {
                    Text("Size Class View Component")
                }
            )
            
            NavigationLink(
                destination: CoreDataView(),
                label: {
                    Text("CoreData View Component")
                }
            )
        }
    }
}

struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}
