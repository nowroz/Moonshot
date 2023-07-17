//
//  MissionView.swift
//  Moonshot
//
//  Created by Nowroz Islam on 17/7/23.
//

import SwiftUI

struct MissionView: View {
    let mission: Mission
    
    var body: some View {
        GeometryReader { geoProxy in
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geoProxy.size.width * 0.8)
                    
                    LabeledContent {
                        Text(mission.formattedLaunchDate)
                    } label: {
                        Text("Launch Date")
                            .font(.subheadline.weight(.semibold))
                    }
                    .padding()
                    
                    Divider()
                        .padding(.horizontal)
                    
                    VStack(alignment: .leading) {
                        
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                    }
                    .padding(.horizontal)
                    
                    Divider()
                        .padding(.horizontal)
                    
                    VStack(alignment: .leading) {
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                            .padding(.horizontal)
                        
                        CrewScrollView(crew: mission.crew)
                    }
                }
                .padding(.bottom)
            }
            .frame(maxWidth: geoProxy.size.width)
        }
        .navigationTitle(mission.name)
        .navigationBarTitleDisplayMode(.inline)
        .background(.themeColor)
    }
    
    init(_ mission: Mission) {
        self.mission = mission
    }
}

#Preview {
    NavigationStack {
        MissionView(ExtractedData.missions[1])
            .preferredColorScheme(.dark)
    }
}
