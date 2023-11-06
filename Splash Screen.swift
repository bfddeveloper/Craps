//
//  Splash Screen.swift
//  Craps
//
//  Created by Brody Dickson on 11/6/23.
//
import SwiftUI

struct SplashView: View {
    
    @State var isActive: Bool = false
    
    var body: some View {
        ZStack {
            if self.isActive {
                Title_screen()
            } else {
                Rectangle()
                    .background(Color.black)
                Text("BFDeveloper")
                    .foregroundStyle(.white)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
        
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
