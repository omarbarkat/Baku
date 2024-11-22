////
////  DuoGetStarted.swift
////  PurposefulSwiftUIAnimations
////
//
////  ANIMATION AND MEANING: Delight and Whimsy
////  Yes, you can animate things just for fun and whimsy. The Duolingo getstarted animation makes it fun and delightful to get started to use the app. The playful animation here can help Duolingo win users over other language learning apps.
////
//
//import SwiftUI
//
//struct DuoGetStarted: View {
//    @State private var isBlinking = false
//    @State private var isTilting = false
//    @State private var isRaising = false
//    @State private var isWaving = false
//    @State private var isShouting = false
//    
//    var size = 35.0
//    var body: some View {
//        VStack(spacing: 0) {
//            VStack {
//                ZStack {
//                    // Tail
//                    Image("TTail")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 50, height: 30)
//                        .rotationEffect(.degrees(isWaving ? -10 : 10), anchor: .bottomLeading)
//                        .offset(x: 20 , y: 32)
//                    
//                    
//                    // Body
//                    Image("TBody") .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: size * 2 , height: size * 5/2)
//                        .offset(x: -10, y: 32)
//                    
//                    
//                    // Face
//                    VStack {
//                        Image("THead")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: size * 5.6/2, height: size * 5/2)
//                            .offset(x: -10, y: -size + 10)
//                    }
//                    
//                }
//                .rotationEffect(.degrees(isTilting ? 0 : 15))
//                
//            }
//            .onAppear{
//                //                withAnimation(.easeOut(duration: 0.2).delay(0.25).repeatCount(6)) {
//                //                    isBlinking.toggle()
//                //                }
//                
//                withAnimation(.easeInOut(duration: 0.1).delay(0.5*1).repeatCount(11, autoreverses: true)) {
//                    isTilting.toggle()
//                }
//                
//                withAnimation(.easeOut(duration: 0.1).delay(0.5).repeatCount(11, autoreverses: true)) {
//                    isWaving.toggle()
//                }
//                
////                                withAnimation(.easeInOut(duration: 1).delay(0.5*3.4).repeatCount(1, autoreverses: true)) {
////                                    isRaising.toggle()
////                                }
//                //
////                                withAnimation(.easeInOut(duration: 1).delay(0.5*3.4).repeatCount(7, autoreverses: true)) {
////                                    isShouting.toggle()
////                                }
//            }
//            
////                        Image("floor")
//        }
//    }
//}
//
//#Preview {
//    DuoGetStarted()
//        .preferredColorScheme(.dark)
//}

import SwiftUI

struct DuoGetStarted: View {
    @ObservedObject private var viewModel = ActivityViewModel()
    @State private var isBlinking = false
    @State private var isTilting = false
    @State private var isRaising = false
    @State private var isWavingRightHand = false
    @State private var isWavingLeftHand = false
    @State private var isMovingRightLeg = false
    @State private var isMovingLeftLeg = false
    
    
    var size = 35.0
    
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                ZStack {
                    // Tail
                    Image("TTail")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 30)
                        .rotationEffect(.degrees(isWavingLeftHand ? -10 : 10), anchor: .bottomLeading)
                        .offset(x: 20 , y: 32)
                    
                    // Body
                    // Right Leg
                    Image("rightleg")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 40)
                        .offset(x: 3, y: 60)
                    
                    // Left Leg
                    Image("liftleg")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 22, height: 40)
                        .offset(x: -22, y: 60)
                    
                    Image("uperBody")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: size * 1.7, height: size * 2.7/2)
                        .offset(x: -10, y: 32)
                    
                    // Right Hand
                    Image("RightHand")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 55, height: 45)
                        // Adjust rotation and anchor to avoid hand going out of body
                        .rotationEffect(.degrees(isWavingRightHand ? -15 : 15), anchor: .top)
                        .offset(x: 9.5, y: 28)
                    
                    // Left Hand
                    Image("liftHand")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 55, height: 46)
                        .rotationEffect(.degrees(isWavingLeftHand ? 15 : -15), anchor: .top)
                        .offset(x: -29, y: 26)
                        
                    
                    // Face
                    VStack {
                        let headImg = viewModel.steps > 1000 ? "wink@4x" : "sick@4x"
//                        Image("THead")
                        Image(headImg)
//                        StepBasedHeadView()
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: size * 5.6/2, height: size * 5/2)
                            .offset(x: -10, y: -size + 10)
                            .rotationEffect(.degrees(isTilting ? 5 : -5), anchor: .center)
//                            .offset(x: isTilting ? -15 : 15)
                    }
                }
            }
            .onAppear {
                viewModel.updateSteps()
                withAnimation(.easeInOut(duration: 0.5).repeatCount(11, autoreverses: true)) {
                    isWavingRightHand.toggle()
                    isWavingLeftHand.toggle()
                }
                
                // Right Leg Animation
                withAnimation(.easeInOut(duration: 0.15).delay(0.2).repeatForever(autoreverses: true)) {
                    isMovingRightLeg.toggle()
                }
                
                // Left Leg Animation
                withAnimation(.easeInOut(duration: 0.15).delay(0.3).repeatForever(autoreverses: true)) {
                    isMovingLeftLeg.toggle()
                }
                
                // Head Animation
                withAnimation(.easeInOut(duration: 0.3).delay(0.2).repeatCount(11, autoreverses: true)) {
                    isTilting.toggle()
                }
            }
        }
    }
}

#Preview {
    DuoGetStarted()
        .preferredColorScheme(.dark)
}
