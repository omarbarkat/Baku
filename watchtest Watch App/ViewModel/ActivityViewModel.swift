//
//  ActivityViewModel.swift
//  Baku Watch App
//
//  Created by eng.omar on 08/11/2024.
//

import Foundation
import Combine

class ActivityViewModel: ObservableObject {
    @Published var steps: Double = 0
    private var healthManager = HealthManager()
    
    init() {
        healthManager.requestAuthorization { [weak self] authorized in
            guard authorized else { return }
            self?.updateSteps()
        }
    }
    
    func updateSteps() {
        healthManager.fetchDailySteps { [weak self] steps in
            DispatchQueue.main.async {
                self?.steps = steps ?? 0
            }
        }
    }
}
