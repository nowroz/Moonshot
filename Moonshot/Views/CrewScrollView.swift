//
//  CrewView.swift
//  Moonshot
//
//  Created by Nowroz Islam on 17/7/23.
//

import SwiftUI

struct CrewScrollView: View {
    let crew: [Mission.CrewMember]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 30) {
                ForEach(crew) { member in
                    NavigationLink {
                        AstronautView(ExtractedData.getAstronaut(member.name))
                    } label: {
                        HStack {
                            Image(member.id)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 104)
                                .clipShape(Circle())
                                .overlay {
                                    Circle()
                                        .strokeBorder(.white)
                                }
                            
                            VStack(alignment: .leading) {
                                Text(ExtractedData.getAstronaut(member.name).name)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                
                                Text(member.role)
                                    .font(.subheadline)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                }
            }
            .padding(.trailing)
        }
        .scrollIndicators(.hidden)
        .background(.themeColor)
    }
}

#Preview {
    NavigationStack {
        CrewScrollView(crew: ExtractedData.missions[0].crew)
            .preferredColorScheme(.dark)
    }
}
