//
//  HealthMangerView.swift
//  Baku Watch App
//
//  Created by eng.omar on 03/10/2024.
//

import SwiftUI
struct RingView: View {
    var percentage: Double
    var color: Color
    var lineWidth: CGFloat
    var radius: CGFloat
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: lineWidth)
                .opacity(0.2)
                .foregroundColor(color)
                .frame(width: radius * 2, height: radius * 2)

            Circle()
                .trim(from: 0.0, to: percentage / 100)
                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                .foregroundColor(color)
                .rotationEffect(Angle(degrees: -90))
                .animation(.linear, value: percentage)
                .frame(width: radius * 2, height: radius * 2)
            GeometryReader { geometry in
                       let size = min(geometry.size.width, geometry.size.height)
                       let arrowRadius = (radius) - (lineWidth / 2)
                       
                       Image(systemName: "arrow.up")
                    .foregroundColor(Color.black)
                           .font(.system(size: 12, weight: .bold)) 
                           .position(
                               x: geometry.size.width / 2,
                               y: geometry.size.height / 2 - arrowRadius
                           )
                           .rotationEffect(Angle(degrees: (percentage / 100) * 0)) 
                           .offset(y: -lineWidth / 2)
                   }
        }
        .frame(width: 150, height: 150)
    }
}
struct HealthMangerView: View {
    @State var pressureValue: Double = 70.0
    @State var heartRateValue: Double = 60.0
    @State var stepsValue: Double = 5000.0
    @State var waterIntakeValue: Double = 4.0
    private let healthManager = HealthManager()
    @Environment (\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    print("activity")
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    HStack {
                        Image(.backGames)
                        Text("Activities")
                            .font(.title3)
                            .foregroundColor(Color(hex: "#DFF848"))
                            .fontWeight(.heavy)
                    }
                   
                })
                .buttonStyle(PlainButtonStyle())
                .offset(x: -20, y: -28)
                ZStack {
                    NavigationLink(destination: ActivitiesDetails()) {
                        Image(.heartbet)
                            .resizable()
                            .frame(width: 35, height: 35)
                            .offset(x: 80, y: -80)
                    }
                    .buttonStyle(PlainButtonStyle())

                  
                    
                    RingView(percentage: pressureValue / 120.0 * 100, color: .red, lineWidth: 20, radius: 85)
                    RingView(percentage: heartRateValue / 100.0 * 100, color: .green, lineWidth: 20, radius: 60)
                    RingView(percentage: stepsValue / 10000.0 * 100, color: .blue, lineWidth: 20, radius: 35)
                }
                .offset(y: -15)
            }
            .onAppear {
                fetchHealthData()
        }
        }.navigationBarBackButtonHidden(true)
    }
    private func fetchHealthData() {
        healthManager.requestAuthorization { success in
            guard success else { return }
            healthManager.fetchHeartRate { heartRate in
                if let heartRate = heartRate {
                    print(heartRate)
                    heartRateValue = heartRate
                }
            }
            healthManager.fetchBloodPressure { bloodPressure in
                if let bloodPressure = bloodPressure {
                    pressureValue = bloodPressure
                }
            }
            healthManager.fetchSteps { steps in
                if let steps = steps {
                    stepsValue = steps
                }
            }
        }
    }
}
#Preview {
    HealthMangerView()
}
