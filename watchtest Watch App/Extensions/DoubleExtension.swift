//
//  DoubleExtension.swift
//  WatchTest
//
//  Created by samh on 20/03/2024.
//

import Foundation

extension Double {
    /// Returns value cast as String with no decimal points.
    var asString: String {
        return String(format: "%.0f", self)
    }
    
    /// Returns value formatted as String with 2 decimal points.
    func normalized() -> String {
        return Formatter.decimalFormatter.string(for: self) ?? ""
    }
}
