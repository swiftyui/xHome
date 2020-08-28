//
//  xHomeApp.swift
//  xHome
//
//  Created by liang wang on 23/8/20.
//

import SwiftUI
import SwiftUIFlux

@main
struct xHomeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(store)
        }
    }
}
