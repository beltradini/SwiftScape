// 
// ComponentListView.swift
// SwiftScape
//
// Created by Alejandro Beltrán on 1/15/25
//

import SwiftUI
import UIKit

struct ComponentListView: View {
  @ObservableObject var canvasModel: CanvasViewModel
  @EnvironmentObject var coordinator: NavigationCoordinator

  var body: some View {
    VStack {
      Text("Preview Mode")
        .font(.title)

        // Render components in preview mode
        ZStack {
          ForEach(canvasModel.components) { component in
            ComponentView(component: component)
          }
        }
    }
    .toolbar {
      Button("Back to Canvas") {
        coordinator.path.removeLast()
      }
    }
  }

}