//
//  Mission.swift
//  Moonshot
//
//  Created by Dylan Perry on 7/31/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import Foundation

struct Mission: Codable, Identifiable {
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }

    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        if let launchDate = launchDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: launchDate)
        } else {
            return "N/A"
        }
    }
    
    var formattedAstronauts: String {
        var astronautString = ""
        for member in crew {
            astronautString += member.name.capitalizingFirstLetter() + ", "
        }
        return astronautString
    }
}

extension Mission {
    struct CrewRole: Codable {
         let name: String
         let role: String
     }
    
    struct CrewMember: Codable {
        let role: String
        let astronaut: Astronaut
    }
}


extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
