//
//  MissionScrollView.swift
//  Moonshot
//
//  Created by Nowroz Islam on 17/7/23.
//

import SwiftUI

struct MissionScrollView: View {
    let missions: [Mission] = ExtractedData.missions
    
    let columns: [GridItem] = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 30) {
                ForEach(missions) { mission in
                    NavigationLink {
                        MissionView(mission)
                    } label: {
                        VStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                            
                            VStack {
                                Text(mission.name)
                                    .font(.headline)
                                    .foregroundStyle(.black)
                                
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundStyle(.black.opacity(0.7))
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.white)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.white)
                        }
                    }
                }
            }
            .padding([.horizontal, .bottom])
        }
        .navigationTitle("Moonshot")
        .background(.themeColor)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    NavigationStack {
        MissionScrollView()
    }
}
