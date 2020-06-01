//
//  TipSplitterView.swift
//  TipSplitter
//
//  Created by Dylan Perry on 5/29/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct TipSplitterView {
    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalBill: Double {
        let orderAmount = Double(checkAmount) ?? 0
        let tipSelection = Double(tipPercentages[tipPercentage])
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        return grandTotal

    }
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople) ?? 1
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0

        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
}

extension TipSplitterView: View {
    public var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount) {
                        UIApplication.shared.endEditing()
                    }
                        .keyboardType(.numbersAndPunctuation)

                }
                
                Section(header: Text("Number Of People At Meal")) {
                    TextField("Number of People: ", text: $numberOfPeople){
                        UIApplication.shared.endEditing()
                    }
                    .keyboardType(.numbersAndPunctuation)
                }
                
                Section(header: Text("Tip Percentage")){
                    Picker("Tip Percentage", selection: $tipPercentage){
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())

                }
                
                Section(header: Text("Total Bill")) {
                    Text("$\(totalBill, specifier: "%.2F")")
                }
                
                Section(header: Text("Amount Per Person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                        .foregroundColor(.green)
                }
            }
            .navigationBarTitle("TipSplitter")
        }
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct TipSplitterView_Previews: PreviewProvider {
    static var previews: some View {
        TipSplitterView()
    }
}
