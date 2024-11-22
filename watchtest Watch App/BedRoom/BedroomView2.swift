//
//  CustomView2.swift
//
//  Created by codia-figma
//

import SwiftUI

struct BedroomView2: View {
    @State public var image1Path: String = "image1_711103796"
    @State public var image2Path: String = "image2_711103798"
    @State public var text1Text: String = "Bedroom"
    @State public var text2Text: String = ""
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image(image1Path)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 338, height: 300, alignment: .topLeading)
                .offset(x: 70)
            Image(image2Path)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 336, height: 199.964, alignment: .topLeading)
                .offset(y: 34)
            BedroomView3(
                text1Text: text1Text,
                text2Text: text2Text)
                .frame(width: 184, height: 30)
                .offset(x: 76, y: 3)
        }
        .frame(width: 336, height: 264, alignment: .topLeading)
//        .clipped()
    }
}

struct BedroomView2_Previews: PreviewProvider {
    static var previews: some View {
        BedroomView2()
    }
}
