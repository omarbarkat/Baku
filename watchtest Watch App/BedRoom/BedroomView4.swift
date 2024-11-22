//
//  CustomView4.swift
//
//  Created by codia-figma
//

import SwiftUI

struct BedroomView4: View {
    @State public var text1Text: String = "Bedroom"
    @State public var text2Text: String = "9:55"
    var body: some View {
        ZStack(alignment: .topLeading) {
            BedroomView5(text1Text: text1Text)
                .frame(width: 79, height: 20)
                .offset(x: 10, y: 6)
            Text(text2Text)
                .foregroundColor(Color(red: 1.00, green: 1.00, blue: 1.00, opacity: 1.00))
                .font(.custom("SFCompactText-Semibold", size: 17))
                .lineLimit(1)
                .frame(alignment: .trailing)
                .multilineTextAlignment(.trailing)
                .offset(x: 138, y: 6)
        }
        .frame(width: 184, height: 30, alignment: .topLeading)
    }
}

struct BedroomView4_Previews: PreviewProvider {
    static var previews: some View {
        BedroomView4()
    }
}
