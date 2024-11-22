//
//  ActivitiesView.swift
//  Baku Watch App
//
//  Created by eng.omar on 30/09/2024.
//

import SwiftUI

struct ActivitiesView: View {
    var body: some View {
        ZStack {
            Image(.activities)
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Button(action: {
                    print("Next button tapped")
                }) {
                    Image(.orangback)
                    Text("Activities")
                        .foregroundColor(.orange)
                        .font(.title3)
                }
                .buttonStyle(PlainButtonStyle())
                .offset(x: -30, y: -115)
             
            }
            Image(.orandcarpt)
                .resizable()
                .frame(width: 130, height: 16)
                .padding(.leading, 100)
                .offset(y: 70)
            
            HStack {
//                Image(.baku)
                DuoGetStarted(size: 34)
//                    .resizable()
                    .frame(width: 88, height: 109)
                    .offset(y: 40)
                Image(.excrsistools)
                    .resizable()
                    .frame(width: 71, height: 40)
                    .offset(y: 90)
              
            }
        }

    }
}

#Preview {
    ActivitiesView()
}
