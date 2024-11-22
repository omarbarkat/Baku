//
//  HealthManger .swift
//  Baku Watch App
//
//  Created by eng.omar on 12/10/2024.
//

import HealthKit

class HealthManager {
    private let healthStore = HKHealthStore()

    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        guard let heartRateType = HKObjectType.quantityType(forIdentifier: .heartRate),
              let bloodPressureType = HKObjectType.quantityType(forIdentifier: .bloodPressureSystolic),
              let stepsType = HKObjectType.quantityType(forIdentifier: .stepCount) else {
            completion(false)
            return
        }

        let typesToRead: Set<HKObjectType> = [heartRateType, bloodPressureType, stepsType]

        healthStore.requestAuthorization(toShare: nil, read: typesToRead) { success, error in
            completion(success)
        }
    }

    func fetchHeartRate(completion: @escaping (Double?) -> Void) {
        guard let heartRateType = HKObjectType.quantityType(forIdentifier: .heartRate) else {
            completion(nil)
            return
        }

        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
        let query = HKSampleQuery(sampleType: heartRateType, predicate: nil, limit: 1, sortDescriptors: [sortDescriptor]) { (query, results, error) in
            guard let result = results?.first as? HKQuantitySample else {
                completion(nil)
                return
            }
            let heartRate = result.quantity.doubleValue(for: HKUnit.count().unitDivided(by: HKUnit.minute()))
            completion(heartRate)
        }
        healthStore.execute(query)
    }

    func fetchBloodPressure(completion: @escaping (Double?) -> Void) {
        guard let bloodPressureType = HKObjectType.quantityType(forIdentifier: .bloodPressureSystolic) else {
            completion(nil)
            return
        }

        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
        let query = HKSampleQuery(sampleType: bloodPressureType, predicate: nil, limit: 1, sortDescriptors: [sortDescriptor]) { (query, results, error) in
            guard let result = results?.first as? HKQuantitySample else {
                completion(nil)
                return
            }
            let bloodPressure = result.quantity.doubleValue(for: HKUnit.millimeterOfMercury())
            completion(bloodPressure)
        }
        healthStore.execute(query)
    }

    func fetchSteps(completion: @escaping (Double?) -> Void) {
        guard let stepsType = HKObjectType.quantityType(forIdentifier: .stepCount) else {
            completion(nil)
            return
        }

        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
        let query = HKSampleQuery(sampleType: stepsType, predicate: nil, limit: 1, sortDescriptors: [sortDescriptor]) { (query, results, error) in
            guard let result = results?.first as? HKQuantitySample else {
                completion(nil)
                return
            }
            let steps = result.quantity.doubleValue(for: HKUnit.count())
            completion(steps)
        }
        healthStore.execute(query)
    }
    func fetchDailySteps(completion: @escaping (Double?) -> Void) {
        guard let stepsType = HKObjectType.quantityType(forIdentifier: .stepCount) else {
            completion(nil)
            return
        }

        let startOfDay = Calendar.current.startOfDay(for: Date())
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: Date(), options: .strictStartDate)
        
        let query = HKStatisticsQuery(quantityType: stepsType, quantitySamplePredicate: predicate, options: .cumulativeSum) { _, result, _ in
            guard let sum = result?.sumQuantity() else {
                completion(nil)
                return
            }
            let steps = sum.doubleValue(for: HKUnit.count())
            completion(steps)
        }
        healthStore.execute(query)
    }

}

