//
//  SelectCharView.swift
//  Baku Watch App
//
//  Created by eng.omar on 30/09/2024.
//

import SwiftUI

struct SelectCharView: View {
@StateObject private var workout = WorkoutManager()
    var body: some View {
        NavigationView {  // Wrap everything inside NavigationView to enable navigation
            ZStack {
                Image("firstFrame")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    // NavigationLink for "Next" button to navigate to SelectOutfitView
                    NavigationLink(destination: SelectOutfitView()) {
                        Text("Next")
                            .foregroundColor(Color.yellow)
                            .font(.title2)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .offset(x: 50, y: -90)
                    
                    Text("Select your character")
                        .offset(x: 0, y: -95)
                        .font(.title3)
                        .bold()
                    
                    Text("Name")
                        .offset(y: -100)
                        .bold()
                }
                
                Image("carbet")
                    .resizable()
                    .frame(width: 150, height: 16)
                    .padding(.leading, 100)
                    .offset(y: 70)
                
                HStack {
                    DuoGetStarted(size: 34)
                        .frame(width: 90, height: 112)
                        .offset(x: 0, y: 40)
                    
                    ZStack {
                        Image("image5_11221492")
                            .offset(y: 50)
                        Text("Bella")
                            .offset(y: 33)
                    }
                }
            }
            .navigationBarHidden(true)  // Hides the default navigation bar
            .onAppear {
//                workout.requestAuthorization()
            }
        }
    }
}


#Preview {
    SelectCharView()
}


//struct SelectCharView: View {
//    @State private var selectedCharacter: String = "Bella"
//
//    var body: some View {
//        ZStack {
//            Image("firstFrame")
//                .resizable()
//                .edgesIgnoringSafeArea(.all)
//            VStack {
//                
//              Text("Next")
//                    .foregroundColor(Color.yellow)
//                    .offset(x:50 , y:-95)
//                    .font(.title2)
//                Text("Selecet your character")
//                    .offset(x:0 , y:-95)
//                    .font(.title3)
//                    .bold()
//                Text("Name")
//                    .offset(y: -100)
//                    .bold()
//                
//
//            }
//          
//            Image(.carbet)
//                .resizable()
//                .frame(width: 150, height: 16)
//                .padding(.leading, 100)
//                .offset(y:70)
//            HStack {
//                Image("image6_8173300")
//                    .resizable()
//                    .frame(width: 90, height: 112)
//                    .offset(x: -5, y: 40 )
//                ZStack {
//                    Image("image5_11221492")
//                        .offset(y: 50)
//                    Text("Bella")
//                        .offset(y:33)
//                }
//             
//            }
//         
//           
//            
//        }
//    }
//}


//Button("Next") {
//    print("next")
//}.offset(x: 40,y: 40)


//        ZStack {
//                   // خلفية
//                   Image("backgroundImage")
//                       .resizable()
//                       .scaledToFill()
//                       .edgesIgnoringSafeArea(.all)
//
//                   VStack {
//                       // الزر العلوي
//                       HStack {
////                           Spacer()
//                           Button(action: {
//                               // أكشن الزر
//                           }) {
//                               Text("Next")
//                                   .foregroundColor(.green) // لون الزر
//                                   .padding()
//                           }
//                       }
////                       .padding(.top, 16)
//
////                       Spacer()
//
//                       // النص العلوي "Select your character"
//                       Text("Select your character")
//                           .font(.headline)
//                           .foregroundColor(.white)
//
//                       // النص الثانوي "Name"
//                       Text("Name")
//                           .font(.title)
//                           .foregroundColor(.white)
////                           .padding(.bottom, 0)
//
//                       // عرض الشخصية
//                       Image("characterImage")
//                           .resizable()
//                           .frame(width: 100, height: 100)
////                           .padding(.bottom, 16)
//
//                       // اسم الشخصية
//                       Text(selectedCharacter)
//                           .font(.title)
//                           .foregroundColor(.white)
//                           .background(Color.clear)
////                           .padding(.bottom, 32)
//
////                       Spacer()
//
//                       // مؤشر التمرير بين الشخصيات
////                       HStack {
////                           Circle()
////                               .frame(width: 8, height: 8)
////                               .foregroundColor(selectedCharacter == "Bella" ? .yellow : .gray)
////                           Circle()
////                               .frame(width: 8, height: 8)
////                               .foregroundColor(selectedCharacter == "Character2" ? .yellow : .gray)
////                           Circle()
////                               .frame(width: 8, height: 8)
////                               .foregroundColor(selectedCharacter == "Character3" ? .yellow : .gray)
////                       }
//                   }
//               }
