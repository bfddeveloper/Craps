//
//  PassSplash.swift
//  Craps
//
//  Created by Brody Dickson on 12/7/23.
//

import SwiftUI

struct PassSplash: View {
    
    @State var isActive: Bool = false
    var PlayerCount: Int
    @State private var action: Int? = 0
    var body: some View {
        NavigationStack{
            ZStack{
                NavigationLink("", tag: 1, selection: $action) {
                    ContentView(PlayerCount: PlayerCount)
                }
                Text("Pass it to the next guy")
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
                
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    self.action = 1
                }
            }
        }
    }
}

struct PassSplash_Previews: PreviewProvider {
    static var previews: some View {
        PassSplash(PlayerCount: 2)
    }
}
