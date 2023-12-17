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
            ZStack{
                Color.green.ignoresSafeArea()
                VStack{
                    Text("Left Right Center Mobile")
                        .font(Font.custom("Silkscreen-Regular", size: 35))
                        .padding()
                    Text("How many players:")
                        .font(Font.custom("Silkscreen-Regular", size: 25))
                    
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
                            .font(Font.custom("Silkscreen-Regular", size: 60))
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
                        Text("Play")
                            .font(Font.custom("Silkscreen-Bold", size: 15))
                        
                    }
                    .buttonStyle(GrowingButton1())
                    .frame(width: 200, height: 15)
                    .padding(30)
                    NavigationLink{
                        Directions()
                    } label: {
                        Text("How to play")
                            .font(Font.custom("Silkscreen-Bold", size: 15))
                    }
                    .buttonStyle(GrowingButton1())
                    .frame(width: 225, height: 15)

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

struct GrowingButton1: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.white)
            .foregroundStyle(.black)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
                
    }
}
