//
//  ContentView.swift
//  Craps
//
//  Created by Brody Dickson on 11/1/23.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State var audioPlayer: AVAudioPlayer!
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
    @State var showBack = 1.0
    
    @State var showView1 = false
    
    @State private var animateGradient = false
    
    init(PlayerCount: Int) {
            self.PlayerCount = PlayerCount
            self._PlayerScoreArray = State(initialValue: [Int](repeating: 3, count: PlayerCount))
        }
    
    
    
    var body: some View {
        NavigationView{
            ZStack{

                RadialGradient(colors: [.green, .yellow], center: .center, startRadius: animateGradient ? 500 : 300, endRadius: animateGradient ? 20 : 40)
                    .ignoresSafeArea()
                    .onAppear {
                        withAnimation(.linear(duration: 6.0).repeatForever(autoreverses: true)) {
                            animateGradient.toggle()
                        }
                    }
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
                            .font(Font.custom("Silkscreen-Bold", size: 40))
                        
                    }
                }
                if showView1{
                    ZStack{
                        RadialGradient(colors: [.green, .yellow], center: .center, startRadius: animateGradient ? 500 : 300, endRadius: animateGradient ? 20 : 40)
                            .ignoresSafeArea()
                            .onAppear {
                                withAnimation(.linear(duration: 6.0).repeatForever(autoreverses: true)) {
                                    animateGradient.toggle()
                                }
                            }
                        VStack{
                            Text("You Won")
                                .font(Font.custom("Silkscreen-Bold", size: 50))
                            NavigationLink {
                                Title_screen(PlayerCount: 3)
                                    .navigationBarBackButtonHidden(true)
                            } label: {
                                Text("Restart?")
                            }
                            .buttonStyle(GrowingButton1())
                        }
                        
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
                                    .frame(width: 80, height: 80)
                                
                                Text(String(PlayerScoreArray[index]))
                                    .font(Font.custom("Silkscreen-Regular", size: 35))
                                    .frame(width: 30, height: 30)
                                
                            }
                            
                        }
                    }
                    .padding()
                    HStack{
                        Text(String(Pot))
                            .font(Font.custom("Silkscreen-Bold", size: 50))
                        Image("Coin")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                    Spacer()
                    HStack(spacing: 10) {
                        Image(PlayerImageArray[PLayerTurnIndex])
                            .resizable()
                            .frame(width: 145, height: 170)
                        
                        Text(String(PlayerScoreArray[PlayerScoreArrayIndex]))
                            .font(Font.custom("Silkscreen-Regular", size: 50))
                            .frame(width: 50, height: 100)
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
                                playSound("dice")
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
                                playSound("dice")

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
                                playSound("dice")

                                chooseRandom2(times: 3)
                                withAnimation(.interpolatingSpring(stiffness: 10, damping: 2)) {
                                    rotation3 += 360
                                }
                            }
                        Image("Arrow")
                            .resizable()
                            .frame(width: 75, height: 75)
                            .onTapGesture {
                                playSound("Woosh")
                                showBack = 0.0
                                self.showView.toggle()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.50) {
                                    if (PlayerScoreArray[PlayerScoreArrayIndex] + Pot) == (PlayerCount * 3) {
                                        return
                                    }
                                    self.showView.toggle()
                                    showBack = 1.0
                                }
                                PassScreenOpac = 1.0
                                if PLayerTurnIndex == Int(PlayerCount - 1) {
                                    PlayerScoreArrayIndex = 0
                                    PLayerTurnIndex = 0
                                } else {
                                    PlayerScoreArrayIndex += 1
                                    PLayerTurnIndex += 1
                                }
                                if (PlayerScoreArray[PlayerScoreArrayIndex] + Pot) == (PlayerCount * 3) {
                                    GameWin()
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.50) {
                                        showBack = 0.0
                                    }
                                }
                                
                            }
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
                if times == 1 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        if DiceValue1 == 0 {
                            if (PlayerScoreArrayIndex - 1) == -1 {
                                self.PlayerScoreArray[(PlayerCount - 1)] += 1
                                self.PlayerScoreArray[PlayerScoreArrayIndex] -= 1
                            } else {
                                self.PlayerScoreArray[(PlayerScoreArrayIndex - 1)] += 1
                                self.PlayerScoreArray[PlayerScoreArrayIndex] -= 1
                            }
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
                        }
                        if (PlayerScoreArrayIndex + 1) < PlayerCount {
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
    func GameWin(){
        showBack = 0.0
        self.showView1.toggle()
    }
    func playSound(_ soundFileName: String) {
        guard let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: "wav", subdirectory: "Sounds") else {
            fatalError("Unable to find \(soundFileName) in bundle")
        }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
        } catch {
            print(error.localizedDescription)
        }
        audioPlayer.play()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(PlayerCount: 3)
    }
}

