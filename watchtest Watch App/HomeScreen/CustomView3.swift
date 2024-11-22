//
//  CustomView3.swift
//
//  Created by codia-figma
//

import SwiftUI

struct CustomView3: View {
    @State public var text3Text: String = "Next"
    var body: some View {
        ZStack(alignment: .topLeading) {
            Text(text3Text)
                .foregroundColor(Color(red: 0.87, green: 0.97, blue: 0.28, opacity: 1.00))
                .font(.custom("Poppins-Regular", size: 17))
                .lineLimit(1)
                .frame(alignment: .trailing)
                .multilineTextAlignment(.trailing)
                .offset(x: 69.5, y: 6)
        }
        .frame(width: 184, height: 31, alignment: .topLeading)
    }
}

struct CustomView3_Previews: PreviewProvider {
    static var previews: some View {
        CustomView3()
    }
}
