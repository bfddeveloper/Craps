//
//  ContentView.swift
//  Craps
//
//  Created by Brody Dickson on 11/1/23.
//

import SwiftUI

struct ContentView: View {
    @State var DiceValue1 = 0
    @State var DiceValue2 = 0
    @State var DiceValue3 = 0
    @State var diceOptions = ["Left", "Right", "Center", "Dot"]
    @State var randomValue = 0
    @State var rotation = 0.0
    @State var rotation2 = 0.0
    @State var rotation3 = 0.0
    
    
    var body: some View {
        HStack {
            Image(diceOptions[DiceValue1])
                .resizable()
                .frame(width: 100, height: 100)
                .rotationEffect(.degrees(rotation))
                .rotation3DEffect(.degrees(rotation), axis: (x:1, y:0, z:0))
                .padding()
                .onTapGesture {
                    chooseRandom(times: 3)
                    withAnimation(.interpolatingSpring(stiffness: 10, damping: 2)) {
                        rotation += 360
                    }
                }
                .padding()
            Image(diceOptions[DiceValue2])
                .resizable()
                .frame(width: 100, height: 100)
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
                .frame(width: 100, height: 100)
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
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
