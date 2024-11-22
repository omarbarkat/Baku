//
//  ArabianMan.swift
//  Baku Watch App
//
//  Created by eng.omar on 06/10/2024.
//

import SwiftUI

struct ArabianMan: View {
    @State private var isBlinking = false
    @State private var isTilting = false
    @State private var isRaising = false
    @State private var isWaving = false
    @State private var isShouting = false
    
    var size = 35.0
    
    var body: some View {
        ZStack {
            Image(.group21) // Replace this with actual image names
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size * 3.6, height: size * 3.5)
                .rotationEffect(.degrees(isTilting ? -15 : 15), anchor: .center)
                .offset(x: 0, y: 15)
        }
        .onAppear {
            // Animations
            withAnimation(.easeInOut(duration: 0.1).delay(0.5).repeatCount(11, autoreverses: true)) {
                isTilting.toggle()
            }

            withAnimation(.easeOut(duration: 0.1).delay(0.5).repeatCount(11, autoreverses: true)) {
                isWaving.toggle()
            }
        }
    }
}

#Preview {
    ArabianMan()
}
//var body: some View {
//    VStack(spacing: 0) {
//        VStack {
//            ZStack {
//                // Tail
//              
//                Image(.arVector)
//                    .resizable()
//                    .frame(width: 120, height: 77)
//                    .offset(x: -10, y: -20)
//                Image("ArbianTail")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 40, height: 40)
//                    .rotationEffect(.degrees(isWaving ? 5 : 10), anchor: .bottomLeading)
//                    .offset(x: -40 , y: 35)
//                
//                
//                // Body
//                
//                Image(.arbianBody) .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: size * 2 , height: size * 5/2)
//                    .offset(x: -10, y: 32)
//                
//                
//                // Face
//                VStack {
//                    Image("THead")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: size * 5.6/2, height: size * 5/2)
//                        .offset(x: -10, y: -size + 10)
//                }
//                Image(.ar2Vector)
//                    .resizable()
//                    .frame(width: 78, height: 22)
//                    .offset(x: -10, y: -40)
//                
//            }
//            .rotationEffect(.degrees(isTilting ? 0 : 15))
//            
//        }
//        .onAppear{
//            //                withAnimation(.easeOut(duration: 0.2).delay(0.25).repeatCount(6)) {
//            //                    isBlinking.toggle()
//            //                }
//            
//            withAnimation(.easeInOut(duration: 0.1).delay(0.5*1).repeatCount(11, autoreverses: true)) {
//                isTilting.toggle()
//            }
//            
//            withAnimation(.easeOut(duration: 0.1).delay(0.5).repeatCount(11, autoreverses: true)) {
//                isWaving.toggle()
//            }
//            
////                                withAnimation(.easeInOut(duration: 1).delay(0.5*3.4).repeatCount(1, autoreverses: true)) {
////                                    isRaising.toggle()
////                                }
//            //
////                                withAnimation(.easeInOut(duration: 1).delay(0.5*3.4).repeatCount(7, autoreverses: true)) {
////                                    isShouting.toggle()
////                                }
//        }
//        
////                        Image("floor")
//    }
//}
