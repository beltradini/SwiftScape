//
//  DetailView.swift
//  SwiftScape
//
//  Created by Alejandro Beltrán on 1/31/25.
//

import SwiftUI

struct DetailView: View {
  let id: UUID

  var body: some View {
    VStack {
      Text("Detail View")
      Text("ID: \(id.uuidString)")
    }
    #if os(visionOS)
    .padding()
    .glassBackgroundEffect()
    .windowStyle(.volumetric) // Apply a volumetric effect to the window
    #endif
  }
}