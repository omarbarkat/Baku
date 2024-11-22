//
//  CustomView1.swift
//
//  Created by codia-figma
//

import SwiftUI

struct CustomView1: View {
    
    @State public var image1Path: String = "image1_11211273"
    @State public var image2Path: String = "image2_11211275"
    @State public var image3Path: String = "image3_11211429"
    @State public var text1Text: String = "my energy"
    @State public var image4Path: String = "image4_11221490"
    @State public var text2Text: String = "Select your character\nName"
    @State public var image5Path: String = "image5_11221492"
    @State public var text3Text: String = "Next"
    @State public var image6Path: String = "image6_11221618"
    @State public var text4Text: String = "Bella"
    @State public var image7Path: String = "image7_11221622"
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            CustomView2(
                image1Path: image1Path,
                image2Path: image2Path,
                image3Path: image3Path,
                text1Text: text1Text)
                .frame(width: 224, height: 234)
                .offset(x:-12, y:29)
               
            Image(image4Path)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 224, height: 294, alignment: .topLeading)
                .offset(x:-12, y:10)
            HStack{
                  
                Text(text2Text)
                    .foregroundColor(Color(red: 1.00, green: 1.00, blue: 1.00, opacity: 1.00))
                    .font(.custom("Poppins-Medium", size: 15))
                    .frame(alignment: .center)
                    .multilineTextAlignment(.center)
                    .offset(x: 42, y: 65)
                }
        
            Image(image5Path)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 114.932, height: 86.071, alignment: .topLeading)
                .offset(x: 114.321, y: 160)
            CustomView3(text3Text: text3Text)
                .frame(width: 184, height: 31)
                .offset(x:75, y:22)
            Image(image6Path)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 18, height: 6, alignment: .bottomLeading)
                .offset(x: 103, y: 248)
                HStack {
                    Spacer()
                        Text(text4Text)
                            .foregroundColor(Color(red: 1.00, green: 1.00, blue: 1.00, opacity: 1.00))
                            .font(.custom("Poppins-Medium", size: 13))
                            .lineLimit(1)
                            .frame(alignment: .center)
                            .multilineTextAlignment(.center)
                    Spacer()
                }
                .offset(x:42, y: 183)
            
            DuoGetStarted(size: 34)
                .frame(width: 86, height: 106, alignment: .topLeading)
                .offset(x: 24, y: 144)
        }
        .frame(width: 224, height: 294, alignment: .topLeading)
        .background(Color(red: 0.98, green: 0.96, blue: 0.93, opacity: 1.00))
        .clipShape(RoundedRectangle(cornerRadius: 34))
        .clipped()
    }
}

struct CustomView1_Previews: PreviewProvider {
    static var previews: some View {
        CustomView1()
    }
}
