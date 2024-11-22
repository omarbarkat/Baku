//
//  CustomView2.swift
//
//  Created by codia-figma
//

import SwiftUI

struct CustomView2: View {
    @State public var image1Path: String = "image1_11211273"
    @State public var image2Path: String = "image2_11211275"
    @State public var image3Path: String = "image3_11211429"
    @State public var text1Text: String = "my energy"
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image(image1Path)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 438, height: 295, alignment: .topLeading)
                .offset(x: 70)
            Image(image2Path)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 326, height: 254, alignment: .topLeading)
                .offset(y: 44)
            Image(image3Path)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 34.603, height: 85.178, alignment: .topLeading)
                .offset(x: 203.734, y: 43.776)
            Text(text1Text)
                .foregroundColor(Color(red: 0.84, green: 0.97, blue: 0.17, opacity: 1.00))
                .font(.custom("Digitalt", size: 11.06).bold())
                .lineLimit(1)
                .frame(alignment: .leading)
                .multilineTextAlignment(.leading)
                .offset(x: 193, y: 25)
        }
        .frame(width: 336, height: 264, alignment: .topLeading)
        .clipped()
    }
}

struct CustomView2_Previews: PreviewProvider {
    static var previews: some View {
        CustomView2()
    }
}
