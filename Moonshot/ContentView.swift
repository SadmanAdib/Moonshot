//
//  ContentView.swift
//  Moonshot
//
//  Created by Sadman Adib on 27/6/22.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    @State private var showingGrid = true
    
//    let columns = [
//        GridItem(.adaptive(minimum: 150))
//    ]
    
    var body: some View {
        NavigationView {
            Group {
                if showingGrid {
                    GridView(astronauts: astronauts, missions: missions)
                } else {
                    ListView(astronauts: astronauts, missions: missions)
                }
            }
           // GridView(astronauts: astronauts, missions: missions)
            //ListView(astronauts: astronauts, missions: missions)
//            ScrollView {
//                LazyVGrid(columns: columns) {
//                    ForEach(missions) { mission in
//                        NavigationLink {
//                            MissionView(mission: mission, astronauts: astronauts)
//                        } label: {
//                            VStack {
//                                Image(mission.image)
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: 100, height: 100)
//                                    .padding()
//
//                                VStack {
//                                    Text(mission.displayName)
//                                        .font(.headline)
//                                        .foregroundColor(.white)
//                                    
//                                    Text(mission.formattedLaunchDateOne)
//                                        .font(.caption)
//                                        .foregroundColor(.white.opacity(0.5))
//                                }
//                                .padding(.vertical)
//                                .frame(maxWidth: .infinity)
//                                .background(.lightBackground)
//                            }
//                            .clipShape(RoundedRectangle(cornerRadius: 10))
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(.lightBackground)
//                            )
//                        }
//                    }
//                }
//                .padding([.horizontal, .bottom])
//            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)// to force dark mode
            .toolbar {
                Button {
                    showingGrid.toggle()
                } label: {
                    Text("Alter View")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            //.previewInterfaceOrientation(.portrait)
    }
}
