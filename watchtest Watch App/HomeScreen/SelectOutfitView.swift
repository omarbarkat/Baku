//
//  SelectOutfitView.swift
//  Baku Watch App
//
//  Created by eng.omar on 30/09/2024.
//

import SwiftUI

struct SelectOutfitView: View {
    @State private var currentIndex = 0
    let totalViews = 2
    var body: some View {
        NavigationView {
            ZStack {
                Image("firstFrame")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Button(action: {
                        print("Next button tapped")
                    }) {
                        NavigationLink(destination: HomeView()) {
                            Text("Next")
                                .foregroundColor(Color.yellow)
                            .font(.title2)
                        }.buttonStyle(PlainButtonStyle())
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    .offset(x: 50, y: -95)
                    
                    Text("Selecet your character")
                        .offset(x: 0, y: -95)
                        .font(.title3)
                        .bold()
                    
                    Text("Outfit")
                        .offset(y: -100)
                        .bold()
                }
                
                Image("carbet")
                    .resizable()
                    .frame(width: 150, height: 16)
                    .padding(.leading, 100)
                    .offset(y: 70)
                
                HStack {
                    Button("", image: .left) {
                        print("Lift")
                        currentIndex = (currentIndex - 1 + totalViews) % totalViews
    //                    if currentIndex > 0 {
    //                        currentIndex -= 1
    //                    }
                    }.buttonStyle(PlainButtonStyle())
                        .offset(x: -15)
    //                Image("image6_8173300")
                    if currentIndex == 0 {
                        DuoGetStarted(size: 34)
        //                    .resizable()
                            .frame(width: 100, height: 130)
                            .offset(x: 5, y: 10)
                    } else {
                        ArabianMan(size: 35)
                            .frame(width: 100, height: 130)
                            .offset(x: 5, y: 0)
                    }
                  
                    Button("", image: .right) {
                        currentIndex = (currentIndex + 1) % totalViews
    //                    if currentIndex < 1 {
    //                        currentIndex += 1
    //                    }
                        print("Lift")
                    }.buttonStyle(PlainButtonStyle())
                        .offset(x: 20)
                  
                }
            }
        }
    }
}

#Preview {
    SelectOutfitView()
}
