//
//  HomeView.swift
//  Baku Watch App
//
//  Created by eng.omar on 03/10/2024.
//


import SwiftUI

struct HomeView: View {
    @State private var isWallDropViewActive = false
    @State private var isBadroomViewActive = false
    @State private var isActivitiesDetailsActive = false
    

    var body: some View {
        NavigationView {
            ZStack {
                Image(.BACKGROUND_2)
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Button(action: {
                        print("Next button tapped")
                    }) {
                        Text("Home")
                            .foregroundColor(Color(hex: "#DFF848"))
                            .font(.title3)
                            .offset(y: 2.5)
                            .fontWeight(.heavy)
                        NavigationLink(destination: WallDropView2()) {
//                            Image(.homeos)
//                                .resizable()
//                                .frame(width: 20, height: 20)
//                                .offset(y: 3)
                        }.buttonStyle(PlainButtonStyle())
                    }
                    .buttonStyle(PlainButtonStyle())
                    .offset(x: -50, y: 10)

                    HStack {
                        Image(.window)
                            .resizable()
                            .frame(width: 205, height: 240)
                            .offset(x: 20, y: 10)
                        VStack {
                            Image(.myenergy)
                                .resizable()
                                .frame(width: 36, height: 10)
                            NavigationLink(destination: ActivitiesDetails()) {
                                Image("image3_11211429")
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                        .offset(x: -40, y: -65)
                    }
                }
                Image(.carbet)
                    .resizable()
                    .frame(width: 130, height: 15)
                    .offset(x: 40, y: 80)
                HStack {
                    ArabianManAnimation(size: 34)
                        .frame(width: 100, height: 130)
                        .offset(x: -40, y: -5)
                }
                .offset(y: 35)
            }
            .navigationBarHidden(true)
            .gesture(
                DragGesture()
                    .onEnded { value in
                        if value.translation.width < -100 {
                            isBadroomViewActive = true
                        } else if value.translation.width > 100 {
                            isActivitiesDetailsActive = true
                        }
                    }
            )
            .background(
                NavigationLink(
                    destination: BadRoom(),
                    isActive: $isBadroomViewActive,
                    label: { EmptyView() }
                )
            )
            .background(
                NavigationLink(
                    destination: HealthMangerView(),
                    isActive: $isActivitiesDetailsActive,
                    label: { EmptyView() }
                )
            )
            .background(
                NavigationLink(
                    destination: WallDropView2(),
                    isActive: $isWallDropViewActive,
                    label: { EmptyView() }
                )
            )
            .onReceive(NotificationCenter.default.publisher(for: .crownTapped)) { _ in
                isWallDropViewActive = true
                print("crown")
            }
        }
    }
}

#Preview {
    HomeView()
}




//import SwiftUI
//
//struct HomeView: View {
//    @State private var isBadroomActive = false
//    var body: some View {
//        NavigationView {  
//            ZStack {
//                Image(.BACKGROUND_2)
//                    .resizable()
//                    .edgesIgnoringSafeArea(.all)
//                
//                VStack {
//                    Button(action: {
//                        print("Next button tapped")
//                    }) {
//                        Text("Home")
//                            .foregroundColor(Color(hex: "#DFF848"))
//                            .font(.title3)
//                            .offset(y: 2.5)
//                        
//                        NavigationLink(destination: WallDropView()) {
//                            Image(.homeos)
//                                .resizable()
//                                .frame(width: 20, height: 20)
//                                .offset(y: 3)
//                        }.buttonStyle(PlainButtonStyle())
//                    }
//                    .buttonStyle(PlainButtonStyle())
//                    .offset(x: -50, y: 10)
//                    
//                    HStack {
//                        Image(.window)
//                            .resizable()
//                            .frame(width: 205, height: 240)
//                            .offset(x: 20, y: 10)
//                        
//                        VStack {
//                            Image(.myenergy)
//                                .resizable()
//                                .frame(width: 36, height: 10)
//                            
//                            // NavigationLink for navigating to ActivitiesDetails
//                            NavigationLink(destination: ActivitiesDetails()) {
//                                Image("image3_11211429")
//                            }
//                            .buttonStyle(PlainButtonStyle())
//                        }
//                        .offset(x: -40, y: -65)
//                    }
//                }
//                Image(.carbet)
//                    .resizable()
//                    .frame(width: 130, height: 15)
//                    .offset(x: 40, y: 80)
//                HStack {
//                    DuoGetStarted(size: 34)
//                        .frame(width: 100, height: 130)
//                        .offset(x: -40, y: -5)
//                }
//                .offset(y: 35)
//            }
//        }
//        .navigationBarHidden(true) 
//        .gesture(
//        DragGesture()
//            .onEnded { value in
//                if value.translation.width < -100 {
//                    isBadroomActive = true
//                }
//                
//            }
//        )
//        .background(
//            NavigationLink(destination: BadRoom(), isActive: $isBadroomActive,
//                           label: {EmptyView()}
//            )
//        )
//    }
//}
//
//
//#Preview {
//    HomeView()
//}

