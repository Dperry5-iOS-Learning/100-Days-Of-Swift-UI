//
//  HabitView.swift
//  HabitTracker
//
//  Created by Dylan Perry on 8/1/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct HabitView {
    @State
    var habit: Habit
    
    @ObservedObject
    var viewModel: ViewModel
}

extension HabitView: View {
    var body: some View {
        VStack {
            Text(habit.name)
                .font(.title)
            Text(habit.description)
                .font(.caption)
            
            Spacer()
            
            HStack {
                Spacer()
                Stepper(onIncrement: {
                    self.habit.numberOfTimes += 1
                    let result = self.viewModel.habits.firstIndex { $0.name == self.habit.name}
                    self.viewModel.habits[result!] = self.habit

                }, onDecrement: {
                    self.habit.numberOfTimes -= 1
                    let result = self.viewModel.habits.firstIndex { $0.name == self.habit.name}
                    self.viewModel.habits[result!] = self.habit
                    
                }) {
                    Text("# of Times: \(self.habit.numberOfTimes)")
                }
                .padding()
                Spacer()
                
            }
            Spacer()
        }
    }
}

//struct HabitView_Previews: PreviewProvider {
//    static var previews: some View {
//        HabitView()
//    }
//}
