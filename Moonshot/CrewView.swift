//
//  HorizontalScrollView.swift
//  Moonshot
//
//  Created by Sadman Adib on 27/6/22.
//

import SwiftUI

struct CrewView: View {
    
    let crew: [CrewMember]
    
    var body: some View{
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(Capsule())
                                .overlay(
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                )

                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundColor(.white)
                                    .font(.headline)
                                Text(crewMember.role)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
    
    init(crew: [CrewMember]) {
       
        self.crew = crew
        
    }
    
}

struct CrewView_Previews: PreviewProvider {

    static var singleCrew = [CrewMember(role: "Command Pilot", astronaut: Astronaut(id: "grissom", name: "sample name", description: "sample data"))]
    
    static var previews: some View {
        CrewView(crew: singleCrew)
            .preferredColorScheme(.dark)
    }
}
