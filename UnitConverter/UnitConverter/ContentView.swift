//
//  ContentView.swift
//  UnitConverter
//
//  Created by Dylan Perry on 5/30/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct ContentView {
    @State private var fromValue: String = ""
    
    @State private var fromUnit: Unit = Unit.milliliters
    
    @State private var destinationUnit: Unit = Unit.milliliters
    
    var resultValue: Float {
        let initialValue = Float(fromValue) ?? 0
        return Converter.convert(value: initialValue, from: fromUnit, to: destinationUnit)
    }
}

extension ContentView: View {
    public var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Unit to Convert")){
                    TextField("Value", text: $fromValue)
                    Picker("Select a Unit", selection: $fromUnit) {
                        ForEach(Unit.allCases, id: \.self) { unit in
                            Text(unit.rawValue)
                        }
                    }
                }
                
                Section(header: Text("Conversion Destination")){
                    Picker("Select a Destination Unit", selection: $destinationUnit) {
                        ForEach(Unit.allCases, id: \.self) { unit in
                            Text(unit.rawValue)
                        }
                    }
                }
                
                Section(header: Text("Results")){
                    Text("\(resultValue, specifier: "%.2f") \(destinationUnit.rawValue)")
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
