//
//  ContentView.swift
//  SwiftScape
//
//  Created by Alejandro Beltrán on 1/31/25.
//

import SwiftUI

struct ContentView: View {
  @State private var path: [AppRoute] = []

  var body: some View {
    NavigationStack(path: $path) {
      HomeView(path: $path)
    }
    #if os(visionOS)
    .glassBackgroundEffect()
    #endif
  }
}