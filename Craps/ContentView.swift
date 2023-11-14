//
//  ContentView.swift
//  Craps
//
//  Created by Brody Dickson on 11/1/23.
//

import SwiftUI

struct ContentView: View {
    var PlayerCount: Int
    @State var DiceValue1 = 0
    @State var DiceValue2 = 0
    @State var DiceValue3 = 0
    @State var diceOptions = ["Left", "Right", "Center", "Dot"]
    @State var randomValue = 0
    @State var rotation = 0.0
    @State var rotation2 = 0.0
    @State var rotation3 = 0.0
    @State var PlayerScoreArray = [Int]()
    @State var PLayerTurnIndex = 0
    @State var PlayerImageArray = ["black", "blue", "brown", "green", "grey", "pink", "red", "teal", "yellow"]
    
    
    
    var body: some View {
        VStack{
            var PlayerScoreArray = Array(repeating: 3, count: PlayerCount)
            
            HStack(spacing: (100/CGFloat(PlayerCount))) {
                ForEach(0..<PlayerCount) {index in
                    VStack{ Image(PlayerImageArray[index])
                            .resizable()
                            .frame(width: 60, height: 80)
                        Text(String(PlayerScoreArray[index]))
                    }
                    
                }
            }
            Spacer()
            HStack(spacing: 10) {
                Image("Icon")
                    .resizable()
                    .frame(width: 150, height: 195)
                Text(String(PlayerScoreArray[0]))
                    .font(.system(size: 35))
                Image("Coin")
                    .resizable()
                    .frame(width: 80, height: 80)
                Image(diceOptions[DiceValue1])
                    .resizable()
                    .frame(width: 75, height: 75)
                    .rotationEffect(.degrees(rotation))
                    .rotation3DEffect(.degrees(rotation), axis: (x:1, y:0, z:0))
                    .padding()
                    .onTapGesture {
                        chooseRandom(times: 3)
                        withAnimation(.interpolatingSpring(stiffness: 10, damping: 2)) {
                            rotation += 360
                        }
                    }
                Image(diceOptions[DiceValue2])
                    .resizable()
                    .frame(width: 75, height: 75)
                    .rotationEffect(.degrees(rotation2))
                    .rotation3DEffect(.degrees(rotation2), axis: (x:1, y:0, z:0))
                    .padding()
                    .onTapGesture {
                        chooseRandom1(times: 3)
                        withAnimation(.interpolatingSpring(stiffness: 10, damping: 2)) {
                            rotation2 += 360
                        }
                    }
                    .padding()
                Image(diceOptions[DiceValue3])
                    .resizable()
                    .frame(width: 75, height: 75)
                    .rotationEffect(.degrees(rotation3))
                    .rotation3DEffect(.degrees(rotation3), axis: (x:1, y:0, z:0))
                    .padding()
                    .onTapGesture {
                        chooseRandom2(times: 3)
                        withAnimation(.interpolatingSpring(stiffness: 10, damping: 2)) {
                            rotation3 += 360
                        }
                    }
            }
        }
    }
        func chooseRandom(times:Int) {
            if times > 0 {
                DispatchQueue.main.asyncAfter (deadline: .now() + 1) {
                    DiceValue1 = Int.random(in: 0...3)
                    chooseRandom(times: times - 1)
            }
        }
    }
    func chooseRandom1(times:Int) {
        if times > 0 {
            DispatchQueue.main.asyncAfter (deadline: .now() + 1) {
                DiceValue2 = Int.random(in: 0...3)
                chooseRandom1(times: times - 1)
        }
    }
}
    func chooseRandom2(times:Int) {
        if times > 0 {
            DispatchQueue.main.asyncAfter (deadline: .now() + 1) {
                DiceValue3 = Int.random(in: 0...3)
                chooseRandom2(times: times - 1)
        }
        }
        if times == 1 {
            
        }
}
    func PlayerScore(){
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(PlayerCount: 3)
    }
}
