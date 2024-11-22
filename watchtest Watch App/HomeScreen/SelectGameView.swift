//
//  SelectGameView.swift
//  Baku Watch App
//
//  Created by eng.omar on 30/09/2024.
//

import SwiftUI

struct SelectGameView: View {
    @State private var selectedButton: Int? = nil
    var body: some View {
          ZStack {
              Image(.gamesBackground)
                  .resizable()
                  .edgesIgnoringSafeArea(.all)
              
          
              
              Image(.gamesSetUp)
                  .resizable()
                  .frame(width: 155, height: 113)
                  .padding(.leading, 100)
                  .offset(x: -20, y: 20)
              
//              Image(.baku)
              DuoGetStarted(size: 34)
//                  .resizable()
                  .frame(width: 84, height: 104)
                  .offset(x: -40, y: 45)
              
              Color.gray
                  .opacity(0.4)
                  .edgesIgnoringSafeArea(.all)
              VStack {
                  Button(action: {
                      print("Back button tapped")
                  }) {
//                      HStack{
//                          Image(.backGames)
//                          Text("Activities")
//                              .foregroundColor(Color(hex: "#D5F82C"))
//                              .font(.title3)
//                      }
                  }
                  .buttonStyle(PlainButtonStyle())
                  .offset(x: 0, y: -120)
              }
              VStack(spacing: 20) {
                  Button(action: {
                      selectedButton = 1
                  }) {
                      Text("Feed your pet")
                          .foregroundColor(selectedButton == 1 ? .black : .white)
                          .padding()
                          .frame(maxWidth: .infinity)
                          .background(selectedButton == 1 ? Color(hex: "#D5F82C") : Color.gray)
                          .cornerRadius(10)
                  }.buttonStyle(PlainButtonStyle())
                      .padding(20)
                      .opacity(0.9)
                      .offset(y: -60)
                  
                  Button(action: {
                      selectedButton = 2
                  }) {
                      Text("Wash your pet")
                          .foregroundColor(selectedButton == 2 ? .black : .white)
                          .padding()
                          .frame(maxWidth: .infinity)
                          .background(selectedButton == 2 ? Color(hex: "#D5F82C") : Color.gray)
                          .cornerRadius(10)
                  }.buttonStyle(PlainButtonStyle())
                      .padding(20)
                      .opacity(0.9)
                      .offset(y: -110)

                  Button(action: {
                      selectedButton = 3
                  }) {
                      Text("Wash your pet")
                          .foregroundColor(selectedButton == 3 ? .black : .white)
                          .padding()
                          .frame(maxWidth: .infinity)
                          .background(selectedButton == 3 ? Color(hex: "#D5F82C") : Color.gray)
                          .cornerRadius(10)
                  }.buttonStyle(PlainButtonStyle())
                      .padding(20)
                      .opacity(0.9)
                      .offset(y: -160)
              }
              .padding(.horizontal, 20)
              .offset(y: 100)
          }
      }
}

#Preview {
    SelectGameView()
}
