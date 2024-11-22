//
//  CustomView5.swift
//
//  Created by codia-figma
//

import SwiftUI

struct BedroomView5: View {
    @State public var text1Text: String = "Bedroom"
    var body: some View {
        HStack(alignment: .top, spacing: 3) {
            Text(text1Text)
                .foregroundColor(Color(red: 0.84, green: 0.97, blue: 0.17, opacity: 1.00))
                .font(.custom("Poppins-Medium", size: 17))
                .lineLimit(1)
                .frame(alignment: .leading)
                .multilineTextAlignment(.leading)
        }
        .frame(width: 79, height: 20, alignment: .topLeading)
        .clipped()
    }
}

struct BedroomView5_Previews: PreviewProvider {
    static var previews: some View {
        BedroomView5()
    }
}
