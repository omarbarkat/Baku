//
//  TiredCharacterView.swift
//  Baku Watch App
//
//  Created by eng.omar on 08/10/2024.
//

import SwiftUI

struct TiredCharacterView: View {
    @State private var isBlinking = false
    @State private var isTilting = false
    @State private var isRaising = false
    @State private var isWaving = false
    @State private var isShouting = false
    
    var size = 35.0
    
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                ZStack {
                    Image("TTail")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 30)
                        .rotationEffect(.degrees(isWaving ? -5 : 5), anchor: .bottomLeading)
                        .offset(x: 20, y: 32)
                    
                    // Body
                    Image("TBody")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: size * 2, height: size * 5/2)
                        .offset(x: -10, y: 32)
                    
                    VStack {
                        ZStack {
                           
                            
                            Image(.headِEmpty)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: size * 5.6/2, height: size * 5/2)
                                
                            Image(.eyeRight)
                                .resizable()
                                .frame(width: 25, height: 30)
                                .offset(x: 23, y: -0)
                                .overlay(
                                    Circle()
                                        .stroke(Color.red.opacity(0.4), lineWidth: 4) 
                                        .frame(width: 24, height: 30)
                                        .offset(x: 23)
                                )
                            Image(.eyeLeft)
                                .resizable()
                                .frame(width: 25, height: 30)
                                .offset(x: -23, y: -0)
                                .overlay(
                                    Circle()
                                        .stroke(Color.red.opacity(0.4), lineWidth: 4)
                                        .frame(width: 24, height: 30)
                                        .offset(x: -23)
                                    
                                )
                            Image(.sadMouth)
                                .resizable()
                                .frame(width: 13, height: 5)
                                .offset(y: 20)
//                            Image(.eyeRight)
//                                .resizable()
//                                .frame(width: 30, height: 35)
//                                .offset(x: 19, y: -0)
                        }
                 
                    }.offset(x: -10, y: isRaising ? -size + 10 : -size + 15)
                    
                }
                .rotationEffect(.degrees(isTilting ? 0 : 10))      
            }
            .onAppear {
                withAnimation(.easeInOut(duration: 1).delay(0.5).repeatForever(autoreverses: true)) {
                    isTilting.toggle()
                }
                
                withAnimation(.easeOut(duration: 1.5).delay(0.5).repeatForever(autoreverses: true)) {
                    isWaving.toggle()
                }
                
                withAnimation(.easeInOut(duration: 2).delay(0.5).repeatForever(autoreverses: true)) {
                    isRaising.toggle()
                }
            }
        }
    }
}



#Preview {
    TiredCharacterView()
}
