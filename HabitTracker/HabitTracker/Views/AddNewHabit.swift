//
//  AddNewHabit.swift
//  HabitTracker
//
//  Created by Dylan Perry on 8/1/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI
struct AddNewHabit {
    @ObservedObject
    var viewModel: ViewModel
    
    @State
    var name: String = ""
    
    @State
    var description: String = ""
}
extension AddNewHabit: View {
    var body: some View {
        VStack(alignment: .center){
            Text("Add New Habit")
                .font(.title)
                .padding()
            Form {
                Section(header: Text("Habit Name")){
                    TextField("Habit Name", text: $name)
                }
                Section(header: Text("Habit Description")){
                    TextField("Habit Name", text: $description)
                }
                Button(action: {
                   let newHabit = Habit(name: self.name , description: self.description)
                   self.viewModel.habits.append(newHabit)
                   self.viewModel.showAddHabitModal = false
                   
               }) {
                    HStack {
                        Spacer()
                        Text("Submit")
                        Spacer()
                    }
               }
            }
        }
    }
}

struct AddNewHabit_Previews: PreviewProvider {
    static var previews: some View {
        AddNewHabit(viewModel: ViewModel())
    }
}
