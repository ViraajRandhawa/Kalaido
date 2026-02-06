//
//  KalaidoApp.swift
//  Kalaido
//
//  Created by Viraaj Randhawa on 22/01/26.
//

import SwiftUI

@main
struct MyApp: App {
    @StateObject private var navigationCoordinator = NavigationCoordinator()
    
    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .environmentObject(navigationCoordinator)
        }
    }
}
