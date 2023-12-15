//
//  CrapsApp.swift
//  Craps
//
//  Created by Brody Dickson on 11/1/23.
//

import SwiftUI

@main
struct CrapsApp: App {
    var body: some Scene {
        WindowGroup {
            SplashView()
                .onAppear {
                                    UINavigationBar.appearance().backIndicatorImage = UIImage(systemName: "arrow.backward")

                                    UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.backward")

                                }
        }
    }
}
