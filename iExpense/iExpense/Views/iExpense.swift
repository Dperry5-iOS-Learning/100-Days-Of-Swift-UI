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
    
    func getColor(currentValue: Int) -> Color {
        if (currentValue < 10) {
            return .gray
        } else if (currentValue < 100) {
            return .orange
        }
        return .red
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
                            .foregroundColor(self.getColor(currentValue: item.amount))
                    }

                    
                }
                .onDelete(perform: removeItems)

            }
            .navigationBarItems(leading: EditButton(), trailing:
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
