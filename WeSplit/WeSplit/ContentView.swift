//
//  ContentView.swift
//  WeSplit
//
//  Created by Dylan Perry on 5/29/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct ContentView {
    @State private var tapCount = 0
    @State private var name: String = ""
    @State private var selectedStudent = 0
    @State private var enableLogging = false
    @State private var selectedColor = 0
    @State private var colors = ["Red", "Green", "Blue"]
    
    let students = ["Harry", "Hermionie", "Ron"]
    func incrementCount(){
        self.tapCount += 1
    }
}



extension ContentView: View {
    public var body: some View {
        NavigationView{
            Form {
                Section(header: Text("Textfield Example")){
                    // Creates Two Way Binding
                    TextField("Enter your Name", text: $name)
                    Text("Your Name is: \(name)")
                    
                }
                Section(header: Text("Picker Example"))  {
                    VStack {
                        Picker("Select your Fave HP Character", selection: $selectedStudent ){
                            ForEach(0..<students.count) {
                                Text(self.students[$0])
                            }
                        }
                        Divider()
                        Text("You chose:  \(students[selectedStudent])")

                    }
                }
                
                Section(header: Text("Button Example")) {
                    Button("Tap Count \(tapCount)"){
                        self.incrementCount()
                    }
                }
                
                Section(footer: Text("Note: Enabling logging may slow down the app")) {
                    Picker(selection: $selectedColor, label: Text("Select a color")) {
                        ForEach(0 ..< colors.count) {
                            Text(self.colors[$0]).tag($0)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    
                    Toggle(isOn: $enableLogging) {
                        Text("Enable Logging")
                    }
                }
                
                Section {
                    Button(action: {
                        print("Saved")
                    }) {
                        Text("Save Changes")
                    }
                }

            }
            .navigationBarTitle("Day 15 - Settings")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
