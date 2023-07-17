//
//  MissionListView.swift
//  Moonshot
//
//  Created by Nowroz Islam on 17/7/23.
//

import SwiftUI

struct MissionListView: View {
    let missions: [Mission] = ExtractedData.missions
    
    var body: some View {
        List(missions) { mission in
            Section {
                NavigationLink {
                    MissionView(mission)
                } label: {
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            Text(mission.name)
                                .font(.headline)
                            
                            Text("Launch Date: \(mission.formattedLaunchDate)")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        
                        Spacer()
                        
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                    }
                }
                .listRowBackground(Color.themeColor)
            }
        }
        .navigationTitle("Moonshot")
        .preferredColorScheme(.dark)
    }
}

#Preview {
    NavigationStack {
        MissionListView()
    }
}
