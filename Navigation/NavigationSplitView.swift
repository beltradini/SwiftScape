//
// NavigationSplitView.swift
// SwiftScape
//
// Created by Alejandro Beltrán on 1/31/25.
//

import SwiftUI

@main 
struct SwiftScapeApp: App {
  var body: some Scene {
    WindowGroup {
      #if os(macOS)
      NavigationSplitView {
        SidebarView()
      } detail: {
        ContentView()
      }
      #else
      ContentView()
      #endif
    }
  }
}