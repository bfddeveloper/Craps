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
    @State var diceOptions = ["Left", "Right", "Center", "Dot", "Roll"]
    @State var randomValue = 0
    @State var rotation = 0.0
    @State var rotation2 = 0.0
    @State var rotation3 = 0.0
    @State var PlayerScoreArray: [Int]
    @State var PLayerTurnIndex = 0
    @State var PlayerImageArray = ["black", "blue", "brown", "green", "grey", "pink", "red", "teal", "yellow"]
    @State var Pot = 0
    @State var PlayerScoreArrayIndex = 0
    @State var DiceRolled = 0
    @State var PassScreenOpac = 0.0
    @State private var action: Int? = 0
    @State var showView = false
    
    init(PlayerCount: Int) {
            self.PlayerCount = PlayerCount
            self._PlayerScoreArray = State(initialValue: [Int](repeating: 3, count: PlayerCount))
        }
    
    
    
    var body: some View {
        NavigationView{
            ZStack{
               
                if showView{
                    ZStack{
                        Rectangle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(stops: [
                                        Gradient.Stop(color: .red, location: 0.5),
                                        Gradient.Stop(color: .green, location: 0.5)
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing))
                            .frame(width: 1000, height: 1000)
                        Text("Pass it to the next guy")
                        
                    }
                }
//                .opacity(PassScreenOpac)
                VStack{
                    //var PlayerScoreArray = [Int](repeating: 3, count: PlayerCount)
                    HStack(spacing: (100/CGFloat(PlayerCount))) {
                        ForEach(0..<PlayerCount) {index in
                            VStack{
                                Image(PlayerImageArray[index])
                                    .resizable()
                                    .frame(width: 60, height: 80)
                                Text(String(PlayerScoreArray[index]))
                            }
                            
                        }
                    }
                    HStack{
                        Image("Coin")
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text(String(Pot))
                    }
                    Spacer()
                    Text(String(PlayerScoreArray[0]))
                    HStack(spacing: 10) {
                        Image(PlayerImageArray[PLayerTurnIndex])
                            .resizable()
                            .frame(width: 125, height: 170)
                        
                        Text(String(PlayerScoreArray[PlayerScoreArrayIndex]))
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
                        Image("Arrow")
                            .resizable()
                            .frame(width: 75, height: 75)
                            .onTapGesture {
                                self.showView.toggle()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.50) {
                                    self.showView.toggle()
                                }
                                PassScreenOpac = 1.0
                                if PLayerTurnIndex == Int(PlayerCount - 1) {
                                    PlayerScoreArrayIndex = 0
                                    PLayerTurnIndex = 0
                                } else {
                                    PlayerScoreArrayIndex += 1
                                    PLayerTurnIndex += 1
                                }
                                
                            }
                    }
                
                }

            }
        }
        .background(
                Image("PokerTable")
                    .resizable()
            )
    }
        func chooseRandom(times:Int) {
            if times > 0 {
                DispatchQueue.main.asyncAfter (deadline: .now() + 1) {
                    DiceValue1 = Int.random(in: 0...3)
                    chooseRandom(times: times - 1)
            }
                if times == 1 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        if self.DiceValue1 == 0 {
                            if (PlayerScoreArrayIndex - 1) == -1 {
                                self.PlayerScoreArray[(PlayerCount - 1)] += 1
                                self.PlayerScoreArray[PlayerScoreArrayIndex] -= 1
                            } else {
                                self.PlayerScoreArray[(PlayerScoreArrayIndex - 1)] += 1
                                self.PlayerScoreArray[PlayerScoreArrayIndex] -= 1
                            }
                            if DiceValue1 == 1 {
                                if (PlayerScoreArrayIndex + 1) > PlayerCount {
                                    self.PlayerScoreArray[0] += 1
                                    self.PlayerScoreArray[PlayerScoreArrayIndex] -= 1
                                } else {
                                    self.PlayerScoreArray[(PlayerScoreArrayIndex + 1)] += 1
                                    self.PlayerScoreArray[PlayerScoreArrayIndex] -= 1
                                }
                            }
                            if DiceValue1 == 2 {
                                Pot += 1
                                self.PlayerScoreArray[PlayerScoreArrayIndex] -= 1
                            }
                        }
                        DiceRolled += 1
                    }
                }
        }
            
    }
    func chooseRandom1(times:Int) {
        if times > 0 {
            DispatchQueue.main.asyncAfter (deadline: .now() + 1) {
                DiceValue2 = Int.random(in: 0...3)
                chooseRandom1(times: times - 1)
        }
            if times == 1 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.25) {
                    if DiceValue2 == 0 {
                        if (PlayerScoreArrayIndex - 1) == -1 {
                            self.PlayerScoreArray[(PlayerCount - 1)] += 1
                            self.PlayerScoreArray[PlayerScoreArrayIndex] -= 1
                        } else {
                            self.PlayerScoreArray[(PlayerScoreArrayIndex - 1)] += 1
                            self.PlayerScoreArray[PlayerScoreArrayIndex] -= 1
                        }
                    }
                    if DiceValue2 == 1 {
                        if (PlayerScoreArrayIndex + 1) > PlayerCount {
                            self.PlayerScoreArray[0] += 1
                            self.PlayerScoreArray[PlayerScoreArrayIndex] -= 1
                        } else {
                            self.PlayerScoreArray[(PlayerScoreArrayIndex + 1)] += 1
                            self.PlayerScoreArray[PlayerScoreArrayIndex] -= 1
                        }
                    }
                    if DiceValue2 == 2 {
                        Pot += 1
                        self.PlayerScoreArray[PlayerScoreArrayIndex] -= 1
                    }
                    DiceRolled += 1
                }
            }
    }
}
    func chooseRandom2(times:Int) {
        if times > 0 {
            DispatchQueue.main.asyncAfter (deadline: .now() + 1) {
                DiceValue3 = Int.random(in: 0...3)
                chooseRandom2(times: times - 1)
        }
            if times == 1 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.50) {
                    
                    
                    
                    if DiceValue3 == 0 {
                        if (PlayerScoreArrayIndex - 1) == -1 {
                            self.PlayerScoreArray[(PlayerCount - 1)] += 1
                            self.PlayerScoreArray[PlayerScoreArrayIndex] -= 1
                        } else {
                            self.PlayerScoreArray[(PlayerScoreArrayIndex - 1)] += 1
                            self.PlayerScoreArray[PlayerScoreArrayIndex] -= 1
                        }
                    }
                    if DiceValue3 == 1 {
                        if (PlayerScoreArrayIndex + 1) > PlayerCount {
                            self.PlayerScoreArray[0] += 1
                            self.PlayerScoreArray[PlayerScoreArrayIndex] -= 1
                        } else {
                            self.PlayerScoreArray[(PlayerScoreArrayIndex + 1)] += 1
                            self.PlayerScoreArray[PlayerScoreArrayIndex] -= 1
                        }
                    }
                    if DiceValue3 == 2 {
                        Pot += 1
                        self.PlayerScoreArray[PlayerScoreArrayIndex] -= 1
                    }
                    DiceRolled += 1
                }
            }
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

