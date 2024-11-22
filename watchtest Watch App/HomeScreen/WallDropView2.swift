//
//  WallDropView2.swift
//  Baku Watch App
//
//  Created by eng.omar on 21/10/2024.
//

import SwiftUI

struct WallDropView2: View {
    @Environment (\.presentationMode) var presentationMode
//    @State private var currentIndex = 0
//    @State var img = [
//        OutFit(img: "outfit"),
//        OutFit(img: "body"),
//        OutFit(img: "outfit"),
//        OutFit(img: "body"),
//        OutFit(img: "outfit"),
//
//    ]
    private var maxIndex = 3
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
                    Text("Wall-drop")
                        .foregroundColor(Color(hex: "#DFF848"))
                        .font(.title3)
                }
                .buttonStyle(PlainButtonStyle())
                .offset(x: -30, y: 10)
                
                Image(.window)
                    .resizable()
                    .frame(width: 205, height: 240)
                    .offset(x: 0, y: 10)
            }
            
            
            Image(.outfitContainer)
                .resizable()
                .frame(width: 56, height: 115)
                .padding(.leading, 100)
                .offset(x: 15 ,y: 25)
            Image(.frame)
                .resizable()
                .frame(width: 70, height: 40)
                .offset(x: -70, y: 90)
                
            
            VStack {
                HStack {
//                    Button(action: {
//                        if currentIndex > 0 {
//                            currentIndex -= 1
//                        }
//                    }) {
//                        Image(.left)
//                    }
//                    .buttonStyle(PlainButtonStyle())
//                    .offset(x: -15)
                    
                    DuoGetStarted(size: 34)
                        .frame(width: 100, height: 130)
                        .offset(x: 5, y: -5)
                    
//                    Button(action: {
//                        if currentIndex < img.count - 1 {
//                            currentIndex += 1
//                        }
//                    }) {
//                        Image(.right)
//                    }
//                    .buttonStyle(PlainButtonStyle())
//                    .offset(x: 20)
                }
                .offset(y: 35)
                
//                TabView(selection: $currentIndex) {
//                    ForEach(0..<img.count, id: \.self) { index in
//                        Image(img[index].img)
//                            .resizable()
//                            .frame(width: 31, height: 25)
//                            .tag(index)
//                    }
//                }
//                .frame(height: 55)
//                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//                .offset(y: 40)
            }
        }.navigationBarBackButtonHidden(true)
    }
}


#Preview {
    WallDropView2()
}


