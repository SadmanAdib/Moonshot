//
//  AstronautView.swift
//  Moonshot
//
//  Created by Sadman Adib on 27/6/22.
//

import SwiftUI

struct AstronautView: View {
    
    let astronaut: Astronaut
    
    @State private var rotationAmount = 0.0
    
    var body: some View {
            ScrollView {
                VStack {
                    
                    Button{
                        withAnimation {
                            rotationAmount += 360
                        }
                    }label: {
                        Image(astronaut.id)
                            .resizable()
                            .scaledToFit()
                            .rotation3DEffect(.degrees(rotationAmount), axis: (x: 0, y: 1, z: 0))
                    }
                    
                    Text(astronaut.description)
                        .padding()
                }
            }
            .background(.darkBackground)
            .navigationTitle(astronaut.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

        static var previews: some View {
            AstronautView(astronaut: astronauts["aldrin"]!)
                .preferredColorScheme(.dark)
        }
}
