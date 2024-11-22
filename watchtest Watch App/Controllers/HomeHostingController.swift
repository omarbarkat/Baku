//
//  HomeHostingController.swift
//  Baku Watch App
//
//  Created by eng.omar on 25/10/2024.
//

import Foundation
import WatchKit
import SwiftUI



class HomeHostingController: WKHostingController<HomeView>, WKCrownDelegate {
//    let crownSequencer = WKCrownSequencer()

    
    override var body: HomeView {
        HomeView()
    }
    override func willActivate() {
        super.willActivate()
        crownSequencer.delegate = self
        crownSequencer.focus()
    }
    override func didDeactivate() {
        super.didDeactivate()
        crownSequencer.delegate = nil
    }
    func crownDidBecomeIdle(_ crownSequencer: WKCrownSequencer?) {
        NotificationCenter.default.post(name: .crownTapped, object: nil)
    }
    
}
extension Notification.Name {
    static let crownTapped = Notification.Name("crownTapped")

}
