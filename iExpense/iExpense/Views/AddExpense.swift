//
//  AddExpense.swift
//  iExpense
//
//  Created by Dylan Perry on 7/24/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct AddExpense {
    @State
    private var name = ""
    
    @State
    private var type = "Personal"
    
    @State
    private var amount = ""
    
    @State
    private var showAlert = false
    
    @ObservedObject
    var expenses: Expenses
    
    @Environment(\.presentationMode)
    var presentationMode

    static let types = ["Business", "Personal"]
}

extension AddExpense: View {
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(Self.types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
            }
            .navigationBarItems(trailing: Button("Save") {
                if let actualAmount = Int(self.amount) {
                    let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
                    self.expenses.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
                } else {
                    self.showAlert.toggle()
                }
                
            })
            .navigationBarTitle("Add new expense")
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Invalid Amount"), message: Text("The integer value you entered could not be converted. Please enter a valid amount."), dismissButton: .cancel(Text("Try Again"), action: {
                self.amount = ""
                self.showAlert.toggle()
            }))
        }
    }
}

struct AddExpense_Previews: PreviewProvider {
    static var previews: some View {
        AddExpense(expenses: Expenses())
    }
}
