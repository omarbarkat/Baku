//
//  CustomView1.swift
//
//  Created by codia-figma
//

import SwiftUI

struct BedroomView1: View {
    @State public var image1Path: String = "image1_711103796"
    @State public var image2Path: String = "image2_711103798"
    @State public var text1Text: String = "Bedroom"
    @State public var image3Path: String = "image3_711103908"
    @State public var image4Path: String = "image4_711103925"
    @State public var image5Path: String = "image5_711103926"
    @State public var image6Path: String = "image6_8173300"
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            BedroomView2(
                image1Path: image1Path,
                image2Path: image2Path,
                text1Text: text1Text,
                text2Text: "")
                .offset(x: -76)
            
            Image(image3Path)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 111, alignment: .topLeading)
                .offset(x: 153.225, y: 82)
            

            Image(image4Path)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 75.658, height: 75.658, alignment: .topLeading)
                .offset(x: 130, y: 62)
            
            Image(image5Path)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 124, height: 46, alignment: .topLeading)
                .offset(x: 50, y: 168)
            
            DuoGetStarted(size: 34)
                .frame(width: 88, height: 109, alignment: .topLeading)
                .offset(x: 9, y: 109)
        }
        .frame(width: 184, height: 250, alignment: .topLeading)
        .background(Color(red: 0.98, green: 0.96, blue: 0.93, opacity: 1.00))
        .clipShape(RoundedRectangle(cornerRadius: 34))
        .clipped()
        
    }
}

struct BedroomView1_Previews: PreviewProvider {
    static var previews: some View {
        BedroomView1()
    }
}
