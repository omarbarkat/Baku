//
//  GamesView.swift
//  Baku Watch App
//
//  Created by eng.omar on 30/09/2024.
//

import SwiftUI

struct GamesView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {

        NavigationView {
            ZStack {
                Image(.gamesBackground)
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Button(action: {
                        print("Next button tapped")
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(.backGames)
                        Text("Games")
                            .foregroundColor(Color(hex: "#D5F82C"))
                            .font(.title3)
                            .fontWeight(.heavy)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .offset(x: -40, y: -110)
                 
                }
                NavigationLink(destination: SelectGameView()) {
                    Image(.gamesSetUp)
                        .resizable()
                        .frame(width: 155, height: 113)
                        .padding(.leading, 100)
                    .offset(x: -20,y: 20)
                }.buttonStyle(PlainButtonStyle())
                
                HStack {
    //                Image(.baku)
    //                    .resizable()
    //                    .frame(width: 84, height: 104)
    //                    .offset(x: -50, y: 50)
                    DuoGetStarted(size: 34)
    //                    .resizable()
                        .frame(width: 84, height: 104)
                        .offset(x: -40, y: 45)
                   
                  
                }
            }
        }.navigationBarBackButtonHidden(true)

    }
}

#Preview {
    GamesView()
}
