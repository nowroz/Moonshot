//
//  AstronautView.swift
//  Moonshot
//
//  Created by Nowroz Islam on 17/7/23.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    
    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text(astronaut.description)
                    .padding()
            }
        }
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
        .background(.themeColor)
    }
    
    init(_ astronaut: Astronaut) {
        self.astronaut = astronaut
    }
}

#Preview {
    NavigationStack {
        AstronautView(ExtractedData.getAstronaut("armstrong"))
            .preferredColorScheme(.dark)
    }
}
