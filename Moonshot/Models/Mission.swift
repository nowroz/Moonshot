//
//  Mission.swift
//  Moonshot
//
//  Created by Nowroz Islam on 17/7/23.
//

import Foundation

struct Mission: Decodable, Identifiable {
    let id: Int
    let launchDate: Date?
    let crew: [CrewMember]
    let description: String
}

extension Mission {
    struct CrewMember: Decodable, Identifiable {
        let name: String
        let role: String
        
        var id: String {
            name
        }
    }
}

extension Mission {
    var name: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
