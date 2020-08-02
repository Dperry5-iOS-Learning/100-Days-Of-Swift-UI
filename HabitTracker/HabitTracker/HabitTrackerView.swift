//
//  HabitTrackerView.swift
//  HabitTracker
//
//  Created by Dylan Perry on 8/1/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI
import Combine

struct HabitTrackerView {
    @ObservedObject
    var viewModel: ViewModel = ViewModel()
}

extension HabitTrackerView {
    func delete(at offsets: IndexSet) {
        self.viewModel.habits.remove(atOffsets: offsets)
    }
}

extension HabitTrackerView: View {
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(self.viewModel.habits, id: \.id) { habit in
                        NavigationLink(destination: HabitView(habit: habit, viewModel: self.viewModel)){
                            Text(habit.name)
                        }
                    }
                    .onDelete(perform: self.delete)
                }
                .listStyle(GroupedListStyle())
            }
            .navigationBarTitle(Text("Habit Tracker"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.viewModel.showAddHabitModal = true
            }, label: {
                Image(systemName: "plus")
            }))
        }
        .sheet(isPresented: $viewModel.showAddHabitModal) {
            AddNewHabit(viewModel: self.viewModel)
        }
    }
}

struct HabitTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        HabitTrackerView()
    }
}
