//
//  HorizontalScrollView.swift
//  Moonshot
//
//  Created by Sadman Adib on 27/6/22.
//

import SwiftUI

struct CrewView: View {
    
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let crew: [MissionView.CrewMember]
    
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
    
    init(crew: [MissionView.CrewMember]) {
       
        self.crew = crew
        
    }
    
}

//struct CrewView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        CrewView() Need to complete this for preview
//    }
//}
