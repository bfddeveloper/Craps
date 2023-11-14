//
//  Title screen.swift
//  Craps
//
//  Created by Brody Dickson on 11/6/23.
//

import SwiftUI

struct Title_screen: View {
    @State var PlayerCount = 3
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
                            if PlayerCount > 3 {
                                PlayerCount -= 1
                            }
                        }
                    Text(String(PlayerCount))
                        .font(.largeTitle)
                        .frame(width: 75, height: 75)
                    Image("Arrow")
                        .resizable()
                        .frame(width: 75, height: 75)
                        .onTapGesture {
                            if PlayerCount < 9 {
                                PlayerCount += 1
                            }
                        }
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
