//
//  MissionView.swift
//  Moonshot
//
//  Created by Sadman Adib on 27/6/22.
//

import SwiftUI

struct MissionView: View {
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission

        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
    
    @State private var rotationAmount = 0.0
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    
    
    let mission: Mission
    let crew: [CrewMember]

        var body: some View {
            GeometryReader { geometry in
                ScrollView {
                    VStack {
                        
                        Button{
                            withAnimation {
                                rotationAmount += 360
                            }
                        }label: {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: geometry.size.width * 0.6)
                                .padding(.top)
                                .rotation3DEffect(.degrees(rotationAmount), axis: (x: 0, y: 1, z: 0))
                        }
                        
                        Text(mission.formattedLaunchDateTwo)
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.5))
                        
                        VStack(alignment: .leading) {
                            
                            RectangleDivider()
                            
                            Text("Mission Highlights")
                                .font(.title.bold())
                                .padding(.bottom, 5)

                            Text(mission.description)
                            
                           RectangleDivider()
                            
                        }
                        .padding(.horizontal)
                        
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                       CrewView(crew: crew)
                        
//                        ScrollView(.horizontal, showsIndicators: false) {
//                            HStack {
//                                ForEach(crew, id: \.role) { crewMember in
//                                    NavigationLink {
//                                        AstronautView(astronaut: crewMember.astronaut)
//                                    } label: {
//                                        HStack {
//                                            Image(crewMember.astronaut.id)
//                                                .resizable()
//                                                .frame(width: 104, height: 72)
//                                                .clipShape(Capsule())
//                                                .overlay(
//                                                    Capsule()
//                                                        .strokeBorder(.white, lineWidth: 1)
//                                                )
//
//                                            VStack(alignment: .leading) {
//                                                Text(crewMember.astronaut.name)
//                                                    .foregroundColor(.white)
//                                                    .font(.headline)
//                                                Text(crewMember.role)
//                                                    .foregroundColor(.secondary)
//                                            }
//                                        }
//                                        .padding(.horizontal)
//                                    }
//                                }
//                            }
//                        }
                    }
                    .padding(.bottom)
                }
            }
            .navigationTitle(mission.displayName)
            .navigationBarTitleDisplayMode(.inline)
            .background(.darkBackground)
        }
    
    }

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    

    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronauts)
            .preferredColorScheme(.dark)
        
    }
}
