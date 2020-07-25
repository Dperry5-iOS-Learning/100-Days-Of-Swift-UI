//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Dylan Perry on 7/24/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}
