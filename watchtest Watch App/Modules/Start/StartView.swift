//
//  ContentView.swift
//  WatchTest Watch App
//
//  Created by samh on 09/02/2024.
//

import SwiftUI
import HealthKit

struct StartView: View {
    @EnvironmentObject var workoutManager: WorkoutManager
    let workoutTypes: [HKWorkoutActivityType] = [.cycling, .running, .walking, .soccer]
        
    var body: some View {
        VStack {
            List {
                ForEach(workoutTypes, id: \.self) { type in
                    NavigationLink(destination: SessionPagingView(), tag: type,
                                   selection: $workoutManager.selectedWorkout) {
                        WorkoutCell(title: type.name, iconImage: type.icon)
                    }
                }
            }
        }
        .listStyle(.carousel)
        .navigationBarTitle("Workouts")
        .onAppear {
            workoutManager.requestAuthorization()
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            StartView()
                .environmentObject(WorkoutManager())
        }
    }
}





// TEST: Watch communication
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.mint)
//            Text("HealthWatch")
//            Button("Send", action: {
//                WatchConnectivityManager.shared.send("Hello World!\n\(Date().ISO8601Format())")
//            })
//        }
//        .padding()
