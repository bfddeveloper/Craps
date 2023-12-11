//
//  PassSplash.swift
//  Craps
//
//  Created by Brody Dickson on 12/7/23.
//

import SwiftUI

struct PassSplash: View {
    
    @State var isActive: Bool = false
    
    var body: some View {
        ZStack {
            if self.isActive {
                Title_screen()
            } else {
                Rectangle()
                    .background(Color.green)
                Text("Pass it On")
                    .foregroundStyle(.white)
                    .font(.system(size: 50))
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

struct PassSplash_Previews: PreviewProvider {
    static var previews: some View {
        PassSplash()
    }
}
