//
//  ExtractedData.swift
//  Moonshot
//
//  Created by Nowroz Islam on 17/7/23.
//

import Foundation

final class ExtractedData {
    static let missions: [Mission] = Bundle.main.decode(file: "missions", withExtension: "json")
    
    static let astronauts: [String: Astronaut] = Bundle.main.decode(file: "astronauts", withExtension: "json")
    
    private init() { }
}

extension ExtractedData {
    static func getAstronaut(_ key: String) -> Astronaut {
        guard let astronaut = astronauts[key] else {
            fatalError("Missing \(key).")
        }
        
        return astronaut
    }
}
