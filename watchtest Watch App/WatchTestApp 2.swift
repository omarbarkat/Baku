//
//  WatchTestApp.swift
//  WatchTest Watch App
//
//  Created by samh on 09/02/2024.
//

import SwiftUI

struct WatchTest_Watch_AppApp: App {
    
    @StateObject private var workoutManager = WorkoutManager()
    @StateObject private var watchManager = WatchConnectivityManager.shared

    @SceneBuilder 
    var body: some Scene {
        WindowGroup {
            NavigationView {
                StartView()
            }
            .sheet(isPresented: $workoutManager.showingSummaryView) {
                SummaryView()
            }
            .environmentObject(workoutManager)
            .environmentObject(watchManager)
        }
    }
}
