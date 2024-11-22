//
//  BadRoom.swift
//  Baku Watch App
//
//  Created by eng.omar on 30/09/2024.
//

import SwiftUI

struct BadRoom: View {
    @State public var image1Path: String = "image1_711103796"
    @State public var image2Path: String = "image2_711103798"
    @State public var text1Text: String = "Bedroom"
    @State public var image3Path: String = "image3_711103908"
    @State public var image4Path: String = "image4_711103925"
    @State public var image5Path: String = "image5_711103926"
    @State public var image6Path: String = "image6_8173300"
    @State private var isGamesViewActive = false
    @State private var isSleep: Bool = false
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            Image(.BACKGROUND_2)
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Button(action: {
                    print("Next button tapped")
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(.backGames)
                    Text("Bedroom")
                        .foregroundColor(Color(hex: "#DFF848"))
                        .font(.title3)
                        .font(.custom("Digitalt", size: 24))
                        .fontWeight(.heavy)
                }
                .buttonStyle(PlainButtonStyle())
                .offset(x: -30, y: 10)
                
                Image(.window)
                    .resizable()
                    .frame(width: 205, height: 240)
                    .offset(x: 0, y: 10)
            }
            Button(action: {
                isSleep.toggle()
            }, label: {
                ZStack {
                    Image("image4_711103925")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .offset(x: 70, y: -15)
                        .opacity(isSleep ? 1 : 0)
                    Image("image3_711103908")
                        .resizable()
                        .frame(width: 30, height: 111)
                        .padding(.leading, 100)
                        .offset(x: 20 ,y: 25)
                }
               
                
            }).buttonStyle(PlainButtonStyle())
           
            
//            Button(action: {
//                isSleep.toggle()
//                print("ok")
//            }) {
//                Image("image4_711103925")
//                    .resizable()
//                    .frame(width: 80, height: 80)
//                    .offset(x: 70, y: -15)
//                    .opacity(isSleep ? 1 : 0) 
//            }
//            .buttonStyle(PlainButtonStyle())
            
            Image("image5_711103926")
                .resizable()
                .frame(width: 124, height: 35)
                .offset(x: 20, y: 80)
            
            VStack {
                HStack {
                    DuoGetStarted(size: 34)
                        .frame(width: 100, height: 130)
                        .offset(x: -35, y: -5)
                }
                .offset(y: 35)
            }
        }
        .navigationBarBackButtonHidden(true)
        .offset(x: 0, y: 5)
        .background(Color(red: 0.98, green: 0.96, blue: 0.93, opacity: 1.00))
        .clipShape(RoundedRectangle(cornerRadius: 34))
        .edgesIgnoringSafeArea(.all)
        .gesture(
            DragGesture()
                .onEnded { value in
                    if value.translation.width < -100 {
                        isGamesViewActive = true
                    }
                }
        )
        .background(
            NavigationLink(
                destination: GamesView(),
                isActive: $isGamesViewActive,
                label: { EmptyView() }
            )
        )
    }
}

#Preview {
    BadRoom()
}




// select character:
//    @State public var image1Path: String = "image1_11211273"
//    @State public var image2Path: String = "image2_11211275"
//    @State public var image3Path: String = "image3_11211429"
//    @State public var text1Text: String = "my energy"
//    @State public var image4Path: String = "image4_11221490"
//    @State public var text2Text: String = "Select your character\nName"
//    @State public var image5Path: String = "image5_11221492"
//    @State public var text3Text: String = "Next"
//    @State public var image6Path: String = "image6_11221618"
//    @State public var text4Text: String = "Bella"
//    @State public var image7Path: String = "image7_11221622"
//
//    var body: some View {
//        ZStack(alignment: .topLeading) {
//            CustomView2(
//                image1Path: image1Path,
//                image2Path: image2Path,
//                image3Path: image3Path,
//                text1Text: text1Text)
//            .frame(width: 224, height: 234)
//            .offset(x:-12, y:29)
//
//            Image(image4Path)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 224, height: 294, alignment: .topLeading)
//                .offset(x:-12, y:10)
//            HStack{
//
//                Text(text2Text)
//                    .foregroundColor(Color(red: 1.00, green: 1.00, blue: 1.00, opacity: 1.00))
//                    .font(.custom("Poppins-Medium", size: 15))
//                    .frame(alignment: .center)
//                    .multilineTextAlignment(.center)
//                    .offset(x: 42, y: 65)
//            }
//
//            Image(image5Path)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 114.932, height: 86.071, alignment: .topLeading)
//                .offset(x: 114.321, y: 160)
//            CustomView3(text3Text: text3Text)
//                .frame(width: 184, height: 31)
//                .offset(x:75, y:22)
//            Image(image6Path)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 18, height: 6, alignment: .bottomLeading)
//                .offset(x: 103, y: 248)
//            HStack {
//                Spacer()
//                Text(text4Text)
//                    .foregroundColor(Color(red: 1.00, green: 1.00, blue: 1.00, opacity: 1.00))
//                    .font(.custom("Poppins-Medium", size: 13))
//                    .lineLimit(1)
//                    .frame(alignment: .center)
//                    .multilineTextAlignment(.center)
//                Spacer()
//            }
//            .offset(x:42, y: 183)
//
//            DuoGetStarted(size: 34)
//                .frame(width: 86, height: 106, alignment: .topLeading)
//                .offset(x: 24, y: 144)
//        }
//        .frame(width: 224, height: 294, alignment: .topLeading)
//        .background(Color(red: 0.98, green: 0.96, blue: 0.93, opacity: 1.00))
//        .clipShape(RoundedRectangle(cornerRadius: 34))
//        .clipped()
//    }
