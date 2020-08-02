//
//  Response.swift
//  Cupcake Corner
//
//  Created by Dylan Perry on 8/2/20.
//

import Foundation

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}
