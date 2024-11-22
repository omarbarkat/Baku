//
//  CustomView3.swift
//
//  Created by codia-figma
//

import SwiftUI

struct BedroomView3: View {
    @State public var text1Text: String = "Bedroom"
    @State public var text2Text: String = "9:55"
    var body: some View {
        ZStack(alignment: .topLeading) {
            BedroomView4(
                text1Text: text1Text,
                text2Text: text2Text)
                .frame(width: 184, height: 30)
        }
        .frame(width: 184, height: 30, alignment: .topLeading)
    }
}

struct BedroomView3_Previews: PreviewProvider {
    static var previews: some View {
        BedroomView3()
    }
}
