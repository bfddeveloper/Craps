//
//  Title screen.swift
//  Craps
//
//  Created by Brody Dickson on 11/6/23.
//

import SwiftUI

struct Title_screen: View {
    @State var PlayerCount = 1
    var body: some View {
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
                        if PlayerCount > 1 {
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
            Button("How to play"){
                
            }
        }
    }
}

struct Title_screen_Previews: PreviewProvider {
    static var previews: some View {
        Title_screen()
    }
}
