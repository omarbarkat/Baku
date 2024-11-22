//
//  WorkoutCell.swift
//  WatchTest Watch App
//
//  Created by samh on 03/10/2024.
//

import SwiftUI

struct WorkoutCell: View {
    var title: String
    var iconImage: Image
    
    var body: some View {
        HStack {
            iconImage
                .frame(width: 30)
                .foregroundColor(.alpha50)
            Text(title)
        }
        .padding()
    }
}
