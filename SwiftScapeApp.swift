//
//  SwiftScapeApp.swift
//  SwiftScape
//
//  Created by Alejandro Beltrán on 1/11/25.
//

import SwiftUI
import UIKit
@main
struct SwiftScapeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    #if os(visionOS)
        WindowGroup(id: "inmersive") {
            InmersiveView()
        }
        .windowStyle(.volumetric)
    #endif
}
