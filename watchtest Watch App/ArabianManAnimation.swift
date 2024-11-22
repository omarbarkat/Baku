//
//  ArabianManAnimation.swift
//  Baku Watch App
//
//  Created by eng.omar on 25/10/2024.
//

import SwiftUI

struct ArabianManAnimation: View {
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
                    VStack {
                        Image(.backHHead)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: size * 6.2/2, height: size * 5/2)
                            .offset(x: -10, y: -size + 25)
                            .rotationEffect(.degrees(isTilting ? 5 : -5), anchor: .center)
//                            .offset(x: isTilting ? -15 : 15)
                    }
                    // Tail
                    Image("TTail")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 30)
                        .rotationEffect(.degrees(isWavingLeftHand ? -10 : 10), anchor: .bottomLeading)
                        .offset(x: 20 , y: 32)
                    
                    // Body
                    // Right Leg
                    Image("Shoes")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 47)
                        .offset(x: -4, y: 60)
                    
                    // Left Leg
                    Image("LShoe")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 39, height: 40)
                        .offset(x: -22, y: 60)
                    
                    Image("Body")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: size * 1.7, height: size * 2.7/2)
                        .offset(x: -10, y: 32)
                    
                    // Right Hand
                    Image("RHand")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 55, height: 45)
                        // Adjust rotation and anchor to avoid hand going out of body
                        .rotationEffect(.degrees(isWavingRightHand ? -15 : 15), anchor: .top)
                        .offset(x: 9.5, y: 28)
                    
                    // Left Hand
                    Image("LHand")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 55, height: 46)
                        .rotationEffect(.degrees(isWavingLeftHand ? 15 : -15), anchor: .top)
                        .offset(x: -25, y: 36)
                        
                    
                    // Face
                    Image(.frontHead)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: size * 5.6/2, height: size * 5/2)
                        .offset(x: -10, y: -size + 10)
                        .rotationEffect(.degrees(isTilting ? 5 : -5), anchor: .center)
//                            .offset(x: isTilting ? -15 : 15)
                  
                }
            }
            .onAppear {
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
    ArabianManAnimation()
        .preferredColorScheme(.dark)
}
