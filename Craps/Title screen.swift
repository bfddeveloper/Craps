//
//  Title screen.swift
//  Craps
//
//  Created by Brody Dickson on 11/6/23.
//

import SwiftUI

struct Title_screen: View {
    @State var PlayerCount = 3
    @State var OpacLeft = 0.0
    @State var OpacRight = 1.0
    
    var body: some View {
        NavigationView {
            VStack{
                Text("LRC")
                    .font(.largeTitle)
                Text("Players")
                    .font(.largeTitle)
                
                HStack{
                    Image("Arrow")
                        .resizable()
                        .frame(width: 75, height: 75)
                        .rotationEffect(Angle(degrees: 180))
                        .onTapGesture {
                            if PlayerCount == 4 {
                                OpacLeft = 0.0
                            } else {
                                OpacLeft = 1.0
                            }
                            if PlayerCount > 3 {
                                PlayerCount -= 1
                            }
                            if PlayerCount == 9 {
                                OpacRight = 0.0
                            } else {
                                OpacRight = 1.0
                            }
                        }
                        .opacity(OpacLeft)
                    Text(String(PlayerCount))
                        .font(.largeTitle)
                        .frame(width: 75, height: 75)
                    Image("Arrow")
                        .resizable()
                        .frame(width: 75, height: 75)
                        .onTapGesture {
                            
                            if PlayerCount == 8 {
                                OpacRight = 0.0
                            } else {
                                OpacRight = 1.0
                            }
                            if PlayerCount < 9 {
                                PlayerCount += 1
                            }
                            if PlayerCount == 3 {
                                OpacLeft = 0.0
                            } else {
                                OpacLeft = 1.0
                            }
                            
                        }
                        .opacity(OpacRight)
                }
                NavigationLink {
                    ContentView(PlayerCount: PlayerCount)
                        .navigationBarBackButtonHidden(true)
                } label: {
                    Text("Lets Play")
                }
                NavigationLink{
                    Directions()
                } label: {
                    Text("How to play")
                }
            }
        }
    }
}

struct Title_screen_Previews: PreviewProvider {
    static var previews: some View {
        Title_screen(PlayerCount: 3)
    }
}
