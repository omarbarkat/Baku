//
//  ExperessionBasedActivityView.swift
//  Baku Watch App
//
//  Created by eng.omar on 08/11/2024.
//

import Foundation
import SwiftUI

struct StepBasedHeadView: View {
    @ObservedObject var viewModel = ActivityViewModel()
    
    var body: some View {
        VStack {
            Image(headImageName)
//                .resizable()
//                .frame(width: 100, height: 100)
//                .padding()
            
//            Text("steprs : \(Int(viewModel.steps))")
//                .font(.headline)
        }
        .onAppear {
            viewModel.updateSteps()
        }
    }
    
    private var headImageName: String {
        switch viewModel.steps {
        case 0..<2000:
            return "angry@4x"

        case 2000..<7000:
            return "happy@4x" 
        default:
            return "wink@4x" 
        }
    }
}

#Preview {
    StepBasedHeadView()
}
