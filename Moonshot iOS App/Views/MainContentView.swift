//
//  ContentView.swift
//  Moonshot iOS App
//
//  Created by Shubham on 10/16/23.
//

import SwiftUI

struct MainContentView: View {
    // MARK: Properties
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    // MARK: Body
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(missions) { mission in
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                    
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundStyle(.white.opacity(0.5))
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(Color.lightBackground)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 10.0))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10.0)
                                    .stroke(.lightBackground)
                            )
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
            
            
            .navigationTitle("Apollo Database")
            .background(Color.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}


#Preview {
    MainContentView()
}
