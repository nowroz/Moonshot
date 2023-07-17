//
//  HomeView.swift
//  Moonshot
//
//  Created by Nowroz Islam on 17/7/23.
//

import SwiftUI

struct HomeView: View {
    @State private var showingAsList: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                if showingAsList {
                    MissionListView()
                        .transition(.opacity)
                } else {
                    MissionScrollView()
                        .transition(.opacity)
                }
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        withAnimation {
                            showingAsList.toggle()
                        }
                    } label: {
                        Label(showingAsList ? "Show as grid" : "Show as list", systemImage: showingAsList ? "square.grid.2x2" : "list.dash")
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
