//
//  watchtestApp.swift
//  watchtest Watch App
//
//  Created by samhon 05/02/23.
//

import SwiftUI

@main
struct watchtest_Watch_AppApp: App {
    @StateObject var workoutManager = WorkoutManager()
    @StateObject private var watchManager = WatchConnectivityManager.shared

    var body: some Scene {
        WindowGroup {
//            BedroomView1()
//            BadRoom()
//            CustomView1()
//            WallDropView()
//            SelectCharView()
            HomeView()
//            HomeHostingController()
//            DuoGetStarted()
//            StartView()
//            NavigationStack { 
//                      StartView()
//                  }
//                  .sheet(isPresented: $workoutManager.showingSummaryView) {
//                      SessionPagingView()
//                  }
//                  .environmentObject(workoutManager)
//                  .environmentObject(watchManager)
            
        }
    }
}

