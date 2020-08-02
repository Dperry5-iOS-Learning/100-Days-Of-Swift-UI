//
//  Habit.swift
//  HabitTracker
//
//  Created by Dylan Perry on 8/1/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import Foundation

struct Habit: Codable, Identifiable {
    let id = UUID()
    let name: String
    let description: String
    var numberOfTimes: Int = 0
}
