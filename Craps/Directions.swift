//
//  Directions.swift
//  Craps
//
//  Created by Brody Dickson on 11/6/23.
//

import SwiftUI

struct Directions: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State var clicks = 0
    @State var value1 = "ideally, all players should sit around a table that provides a surface for rolling the dice, but any type of seating arrangement can be used as long as the players are in a circular formation. The middle of the circle is the center 'pot' where chips will be placed during the game."
    @State var value2 = "Before the game begins, each player receives three chips."
    @State var value3 = "Choose a player to be the starting player. This can be the youngest player, or the oldest player, the player who won the previous game, or any other method of your choosing."
    @State var value4 = "The starting player takes their turn, then players will continue taking turns in clockwise order until the game ends.On your turn, roll the dice. How many dice you roll depends on how many chips you have."
    var body: some View {
        Text("How To Play")
            .font(Font.custom("Silkscreen-Bold", size: 30))
            .multilineTextAlignment(.center)
        
        ScrollView {
            VStack{
                Text("Overview")
                    .multilineTextAlignment(.center)
                    .font(Font.custom("Silkscreen-Bold", size: 30))
                VStack{
                    Text("ideally, all players should sit around a table that provides a surface for rolling the dice, but any type of seating arrangement can be used as long as the players are in a circular formation. The middle of the circle is the center 'pot' where chips will be placed during the game.")
                    Text("Before the game begins, each player receives three chips.")
                        .padding()
                    Text("Choose a player to be the starting player. This can be the youngest player, or the oldest player, the player who won the previous game, or any other method of your choosing.")
                        .padding()
                    Text("The starting player takes their turn, then players will continue taking turns in clockwise order until the game ends.On your turn, roll the dice. How many dice you roll depends on how many chips you have.")
                        .padding()
                }
            }
            VStack{
                Text("Dice Rolling")
                    .multilineTextAlignment(.center)
                    .font(Font.custom("Silkscreen-Bold", size: 30))
                VStack{
                    Text("If you have 3 or more chips, roll all 3 dice.")
                        
                        .padding()
                    Text("If you have 2 chips, roll 2 dice.")
                        
                        .padding()
                    Text("If you have 1 chip, roll 1 die.")
                        .padding()
                    Text("If you have no chips, don’t roll any dice.")
                        .padding()
                }
            }
            VStack{
                Text("Game Play")
                    .multilineTextAlignment(.center)
                    .font(Font.custom("Silkscreen-Bold", size: 30))
                VStack{
                    Text("After rolling the dice, look at each die one at a time and take an action based on what was rolled")
                        .padding()
                    Text("If you roll an Left, you must give one of your chips to the player on your left.")
                        .padding()
                    Text("If you roll a C, you must put one of your chips in the pot in the center.")
                        .padding()
                    Text("If you roll a dot (or a 1, 2, or 3), nothing happens.")
                        .padding()
                    Text("If at any point only one player has chips remaining, that player is the winner. They get to keep all the chips they have in front of them as well as all the chips from the center pot.")
                }
            }
        } .font(Font.custom("Silkscreen-Regular", size: 18))
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    VStack{

                        Button {
                            dismiss()
                        } label: {
                            HStack {
                                Image(systemName: "arrow.backward")
                                Text("Home")
                                    .font(Font.custom("Silkscreen-Bold", size: 15))
                            }
                        }
                        .buttonStyle(GrowingButton())
                        .multilineTextAlignment(.center)
                    }
                }
                        }
//        HStack{
//            Rectangle()
//                .frame(width: 20, height: 20)
//            Text(value1)
//        }
//        HStack{
//            Text(value2)
//        }
//        HStack{
//            Text(value3)
//        }
//        HStack{
//            Text(value4)
//        }

//             Text("If you have 3 or more chips, roll all 3 dice.")
//            Text("If you have 2 chips, roll 2 dice.")
//            Text("If you have 1 chip, roll 1 die.")
//            Text(" If you have no chips, don’t roll any dice.")
//            Text(" After the dice are rolled, you must take actions based on what is showing on the dice.")
        
//        Button("continue"){
//            if clicks < 3 {
//                clicks += 1
//
//            }
//            if clicks == 1 {
//                value1 = "If you have 3 or more chips, roll all 3 dice."
//                value2 = "If you have 2 chips, roll 2 dice."
//                value3 = "If you have 1 chip, roll 1 die."
//                value4 = "If you have no chips, don’t roll any dice."
//                clicks = 1
//            }
//            if clicks == 2 {
//                value1 = "After rolling the dice, look at each die one at a time and take an action based on what was rolled."
//                value2 = "If you roll an Left, you must give one of your chips to the player on your left."
//                value3 = "If you roll a C (or a 5), you must put one of your chips in the pot in the center."
//                value4 = "If you roll a dot (or a 1, 2, or 3), nothing happens."
//                clicks = 2
//            }
//            if clicks == 3 {
//                value1 = "If at any point only one player has chips remaining, that player is the winner. They get to keep all the chips they have in front of them as well as all the chips from the center pot."
//                value2 = ""
//                value3 = ""
//                value4 = ""
//            }
//        }
//        Button("Back"){
//            clicks -= 1
//            if clicks == 0 {
//                value1 = "ideally, all players should sit around a table that provides a surface for rolling the dice, but any type of seating arrangement can be used as long as the players are in a circular formation. The middle of the circle is the center 'pot' where chips will be placed during the game."
//                value2 = "Before the game begins, each player receives three chips."
//                value3 = "Choose a player to be the starting player. This can be the youngest player, or the oldest player, the player who won the previous game, or any other method of your choosing."
//                value4 = "The starting player takes their turn, then players will continue taking turns in clockwise order until the game ends.On your turn, roll the dice. How many dice you roll depends on how many chips you have."
//                clicks = 0
//            }
//
//            if clicks == 1 {
//                value1 = "If you have 3 or more chips, roll all 3 dice."
//                value2 = "If you have 2 chips, roll 2 dice."
//                value3 = "If you have 1 chip, roll 1 die."
//                value4 = "If you have no chips, don’t roll any dice."
//                clicks = 1
//            }
//            if clicks == 2 {
//                value1 = "After rolling the dice, look at each die one at a time and take an action based on what was rolled."
//                value2 = "If you roll an Left, you must give one of your chips to the player on your left."
//                value3 = "If you roll a C (or a 5), you must put one of your chips in the pot in the center."
//                value4 = "If you roll a dot (or a 1, 2, or 3), nothing happens."
//                clicks = 2
//            }
//
//
//        }
//
////             Text("If you roll an Left, you must give one of your chips to the player on your left.")
////            Text("If you roll a C (or a 5), you must put one of your chips in the pot in the center.")
////            Text("If you roll a R (or a 6) you must give one of your chips to the player on your right.")
////            Text("If you roll a dot (or a 1, 2, or 3), nothing happens.")
////            Text("After rolling the dice and taking actions, pass the dice to the next player.")
////
////             Text("Example: If you had 5 chips and rolled an L (4), a C (5), and a dot (2), you would give one chip to the player on your left and put one chip in the center pot. You would then have 3 chips remaining.")
////
////             Text("If you lose all your chips, you aren’t out of the game but you don’t roll any dice or take any actions on your turn. Other players can still give you chips however, and if it comes back to your turn and you have chips again then you take your turn as normal.")
////
////             Text("Game End and Winning")
////
////             Text("If at any point only one player has chips remaining, that player is the winner. They get to keep all the chips they have in front of them as well as all the chips from the center pot.")
    }
}

struct Directions_Previews: PreviewProvider {
    static var previews: some View {
        Directions()
    }
}

struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()

            .foregroundStyle(.black)
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
