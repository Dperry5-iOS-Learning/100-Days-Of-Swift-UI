//
//  Question.swift
//  Edutainment
//
//  Created by Dylan Perry on 7/12/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import Foundation

struct Question {
    public let valueOne: Int
    public let valueTwo: Int
    public var answer: Int {
        get { valueOne * valueTwo }
    }
}

extension Question: Equatable {}
