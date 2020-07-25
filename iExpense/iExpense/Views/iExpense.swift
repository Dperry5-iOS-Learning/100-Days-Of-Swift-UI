//
//  iExpense.swift
//  iExpense
//
//  Created by Dylan Perry on 7/24/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct iExpense {
    @ObservedObject
    var expenses = Expenses()
    
    @State
    private var showingAddExpense = false

}

extension iExpense {
    func removeItems(at offsets: IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
}

extension iExpense: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items, id: \.id) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }

                        Spacer()
                        Text("$\(item.amount)")
                    }
                }
                .onDelete(perform: removeItems)

            }
            .navigationBarItems(trailing:
                Button(action: {
                    self.showingAddExpense = true
                }) {
                    Image(systemName: "plus")
                }
            )
            .navigationBarTitle("iExpense")
        }
        .sheet(isPresented: $showingAddExpense){
            AddExpense(expenses: self.expenses)
        }
    }
}

struct iExpense_Previews: PreviewProvider {
    static var previews: some View {
        iExpense()
    }
}
