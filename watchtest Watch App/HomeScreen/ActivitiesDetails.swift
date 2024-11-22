//
//  ActivitiesDetails.swift
//  Baku Watch App
//
//  Created by eng.omar on 03/10/2024.
//

import SwiftUI

struct CustomProgressBar: View {
    var progress: Double // 0 to 1
    var barColor: Color
    var backgroundColor: Color
    var lineWidth: CGFloat = 7

    var body: some View {
        ZStack(alignment: .leading) {
            // Background bar
            RoundedRectangle(cornerRadius: lineWidth / 2)
                .frame(height: lineWidth)
                .foregroundColor(backgroundColor)
                .frame(maxWidth: .infinity)
            
            // Progress bar
            RoundedRectangle(cornerRadius: lineWidth / 2)
                .frame(width: CGFloat(progress) * 180, height: lineWidth)
                .foregroundColor(barColor)
        }
    }
}

struct barDetails: View {
    var title: String
    var calories: String
    var cupWaterNum: Int?
    var img: String
    var progress: Double
    var barColor: Color
    var total: String
    var background: String
    var water: String
    var showBackground: Bool
    var showButton: Bool
    var buttonAction: (() -> Void)?
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Button to increase water intake
                if showButton, let action = buttonAction {
                    Button(action: {
                        action() // Call the action when pressed
                    }) {
                        Image(water)
                            .resizable()
                            .frame(width: 30, height: 40)
                            .offset(x: 60, y: 3)
                    }
                }
                
                // Background image
                Image(background)
                    .resizable()
                    .frame(width: geometry.size.width + 20, height: geometry.size.height - 40)
                    .cornerRadius(15)
                    .offset(x: -18, y: 15)
                
                // Content
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.caption2)
                        .foregroundColor(.secondary)
                        .bold()
                        .offset(x: -20 , y: 5)
                    HStack {
                        Text(calories)
                            .font(.system(size: 15))
                            .bold()
                            .offset(x: -20, y: 3)
                        Text(total)
                            .font(.system(size: 15))
                            .bold()
                            .foregroundColor(.secondary)
                            .offset(x: -22, y: 3)
                            .fontWeight(.heavy)
                    }
                    CustomProgressBar(progress: progress, barColor: barColor, backgroundColor: .gray.opacity(0.2))
                        .offset(x: -20, y: 2)
                        .frame(width: 180)
                }
                .padding(.trailing, 0)
                
                Spacer()
                
                // Image on the right
                Image(img)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .offset(x: 60, y: -5)
            }
            .padding()
        }
        .frame(height: 80)
    }
}

struct Details: Identifiable {
    var id = UUID()
    var title: String
    var calories: String?
    var img: String
    var progress: Double
    var barColor: Color
    var total: String
    var backgound: String?
    var water: String?
    var cupWaterNum: Int?
}

struct ActivitiesDetails: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var cupWaterNum: Int = 6

    var details: [Details] {
        [
            Details(title: "Burn Calories", calories: "97 Cal", img: "FireNew", progress: 0.32, barColor: .yellow, total: "/1000"),
            Details(title: "Total Steps", calories: "1.500", img: "StepsNew", progress: 0.5, barColor: Color(hex: "#767BF4"), total: "/2500"),
            Details(title: "Water", calories: "\(cupWaterNum) /8 GLASSES", img: "", progress: 0.88, barColor: Color(hex: "#45ACFF"), total: "", backgound: "DrinkWater", water: "water"),
            Details(title: "Sleep", calories: "7", img: "sleepNew", progress: 0.88, barColor: .green, total: "/8 Hour"),
        ]
    }

    var body: some View {
        NavigationView {
            ZStack {
                Button(action: {
                    print("Back button tapped")
                    presentationMode.wrappedValue.dismiss()
                }
                )
                {
                    NavigationLink(destination: HealthMangerView()) {
                        HStack {
                            Image(.backGames)
                            Text("Activities")
                                .foregroundColor(Color(hex: "#D5F82C"))
                                .font(.title3)
                        }.offset(x: 30)
                    }
                    .buttonStyle(PlainButtonStyle())
                }.buttonStyle(PlainButtonStyle())
                .offset(x: -30, y: -110)

                List(details.indices, id: \.self) { index in
                    barDetails(
                        title: details[index].title,
                        calories: details[index].calories ?? "",
                        img: details[index].img,
                        progress: details[index].progress,
                        barColor: details[index].barColor,
                        total: details[index].total,
                        background: details[index].backgound ?? "",
                        water: details[index].water ?? "",
                        showBackground: index == 2,
                        showButton: index == 2,
                        buttonAction: {
                            if index == 2 { // Only increase cupWaterNum for index 2
                                cupWaterNum += 1
                            }
                        }
                    )
                    .frame(height: 55)
                }
                .ignoresSafeArea()
                .edgesIgnoringSafeArea(.all)
                .padding(.bottom, 0)
                .offset(y: 5)
                .frame(maxHeight: .infinity)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ActivitiesDetails()
}

