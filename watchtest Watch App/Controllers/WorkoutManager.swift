//
//  WorkoutManager.swift
//  WatchTest Watch App
//
//  Created by samh on 13/02/2024.
//

import Foundation
import HealthKit

class WorkoutManager: NSObject, ObservableObject {
    private var session: HKWorkoutSession?
    var builder: HKLiveWorkoutBuilder?
    let healthStore = HKHealthStore()
    
    var selectedWorkout: HKWorkoutActivityType? {
        didSet {
            guard let selectedWorkout = selectedWorkout else { return }
            startWorkout(workoutType: selectedWorkout)
        }
    }

    @Published var showingSummaryView: Bool = false {
        didSet {
            if showingSummaryView == false {
                resetWorkout()
            }
        }
    }

    @Published var running = false
    private var pauseStartTime: Date?
    
    // MARK: - Authorization
    func requestAuthorization() {
        let typesToShare: Set = [
            HKQuantityType.workoutType()
        ]

        let typesToRead: Set = [
            HKQuantityType.quantityType(forIdentifier: .heartRate)!,
            HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned)!,
            HKQuantityType.quantityType(forIdentifier: .distanceWalkingRunning)!,
            HKQuantityType.quantityType(forIdentifier: .distanceCycling)!,
            HKObjectType.activitySummaryType()
        ]

        healthStore.requestAuthorization(toShare: typesToShare, read: typesToRead) { success, error in
            // Handle error.
        }
    }

    // MARK: - Session State Control
    func togglePause() {
        if running {
            pause()
        } else {
            resume()
        }
    }

    func pause() {
        guard running else { return }
        
        // Store the current time when pausing
        pauseStartTime = Date()
        session?.pause()
        DispatchQueue.main.async {
            self.running = false
        }
    }

    func resume() {
        guard let pauseStartTime = pauseStartTime else { return }
        
        // Resume the workout session
        session?.resume()
        DispatchQueue.main.async {
            self.running = true
            
            // Adjust any necessary calculations based on the pause duration
        }
    }

    func endWorkout() {
        guard let session = session else { return }
        
        session.end()
        
        builder?.endCollection(withEnd: Date()) { success, error in
            guard success else {
                // Handle error if needed
                return
            }
            self.builder?.finishWorkout { workout, error in
                DispatchQueue.main.async {
                    self.workout = workout
                    self.updateResults()
                    self.showingSummaryView = true
                }
            }
        }
    }

    // MARK: - Live Data Publishers
    @Published var averageHeartRate: Double = 0
    @Published var heartRate: Double = 0
    @Published var activeEnergy: Double = 0
    @Published var distance: Double = 0
    @Published var workout: HKWorkout?
    @Published var results: Workout?
    
    var elapsedTime: TimeInterval {
        return builder?.elapsedTime ?? 0
    }

    // MARK: - Workout Control
    func startWorkout(workoutType: HKWorkoutActivityType) {
        let configuration = HKWorkoutConfiguration()
        configuration.activityType = workoutType
        configuration.locationType = .outdoor

        do {
            session = try HKWorkoutSession(healthStore: healthStore, configuration: configuration)
            builder = session?.associatedWorkoutBuilder()
            print("Workout session started successfully")
        } catch {
            print("Error starting workout session: \(error.localizedDescription)")
            return
        }

        session?.delegate = self
        builder?.delegate = self

        builder?.dataSource = HKLiveWorkoutDataSource(healthStore: healthStore,
                                                      workoutConfiguration: configuration)
        
        DispatchQueue.main.async {
            self.running = true
        }

        let startDate = Date()
        session?.startActivity(with: startDate)
        builder?.beginCollection(withStart: startDate) { success, error in
            print(success)
            print(error)
            print(startDate)
            
            if success {
                print("Data collection began successfully")
            } else {
                print("Failed to begin data collection: \(error?.localizedDescription ?? "Unknown error")")
            }
        }
    }
    
    func resetWorkout() {
        selectedWorkout = nil
        builder = nil
        workout = nil
        results = nil
        session = nil
        activeEnergy = 0
        averageHeartRate = 0
        heartRate = 0
        distance = 0
        pauseStartTime = nil
    }
    
    private func updateResults() {
        guard let workout = workout else { return }
        results = Workout(from: workout, avgHeartRate: averageHeartRate)
    }
}

// MARK: - HKWorkoutSessionDelegate
extension WorkoutManager: HKWorkoutSessionDelegate {
    func workoutSession(_ workoutSession: HKWorkoutSession, didChangeTo toState: HKWorkoutSessionState,
                          from fromState: HKWorkoutSessionState, date: Date) {
        DispatchQueue.main.async {
            self.running = toState == .running
        }

        guard toState == .ended else { return }
        builder?.endCollection(withEnd: date) { success, error in
            self.builder?.finishWorkout { workout, error in
                DispatchQueue.main.async {
                    self.workout = workout
                    self.updateResults()
                }
            }
        }
    }

    func workoutSession(_ workoutSession: HKWorkoutSession, didFailWithError error: Error) {
        // Handle error.
    }
}

// MARK: - HKLiveWorkoutBuilderDelegate
extension WorkoutManager: HKLiveWorkoutBuilderDelegate {
    func workoutBuilder(_ workoutBuilder: HKLiveWorkoutBuilder, didCollectDataOf collectedTypes: Set<HKSampleType>) {
        for type in collectedTypes {
            guard let quantityType = type as? HKQuantityType else { return }

            let statistics = workoutBuilder.statistics(for: quantityType)
            updateForStatistics(statistics)
        }
    }
    
    func workoutBuilderDidCollectEvent(_ workoutBuilder: HKLiveWorkoutBuilder) {
        // Handle event if needed
    }

    private func updateForStatistics(_ statistics: HKStatistics?) {
        guard let statistics = statistics else { return }

        DispatchQueue.main.async {
            switch statistics.quantityType {
            case HKQuantityType.quantityType(forIdentifier: .heartRate):
                let heartRateUnit = HKUnit.count().unitDivided(by: HKUnit.minute())
                self.heartRate = statistics.mostRecentQuantity()?.doubleValue(for: heartRateUnit) ?? 0
                self.averageHeartRate = statistics.averageQuantity()?.doubleValue(for: heartRateUnit) ?? 0
            case HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned):
                let energyUnit = HKUnit.kilocalorie()
                self.activeEnergy = statistics.sumQuantity()?.doubleValue(for: energyUnit) ?? 0
            case HKQuantityType.quantityType(forIdentifier: .distanceWalkingRunning), HKQuantityType.quantityType(forIdentifier: .distanceCycling):
                let meterUnit = HKUnit.meter()
                self.distance = statistics.sumQuantity()?.doubleValue(for: meterUnit) ?? 0
            default:
                return
            }
        }
    }
}
