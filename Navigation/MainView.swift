// 
// MainView.swift
// SwiftScape
// 
// Created by Alejandro Beltrán on 1/15/25
//

import SwiftUI
import UIKit

struct MainView: View {
  @StateObject private var coordinator = NavigationCoordinator()
  @StateObject private var canvasModel = CanvasViewModel()

  var body: some View {
    NavigationStack(path: $coordinator.path) {
      SplitView {
        // Lefts sidebar 
        ComponentListView(canvasModel: canvasModel)
          .frame(minWidth: 250, maxWidth: 300)

        // Main content 
        ZStack {
          switch coordinator.activeView {
            case .canvas:
              CanvasView(canvasModel: canvasModel)
            case .preview: 
              PreviewView(canvasModel: canvasModel)
            case .settings:
              SettingsView()
            case .components:
              ComponentListView(canvasModel: canvasModel)
           }
        }

        // Right sidebar
        if let selectedComponent = coordinator.selectedComponent {
          ComponentInspectorView(component: selectedComponent)
            .frame(minWidth: 250, maxWidth: 300)
      }
    }
    .toolbar {
      ToolbarItem(placement: .primaryAction) {
        Button("Generate Code") {
          let code = canvasModel.generateCode()
          print(code) // Export or display the code
        }
        Button("Preview") {
          coordinator.path.append(.preview)
        }
        Button("Settings") {
          coordinator.path.append(.settings)
        }
        Button("Components") {
          coordinator.path.append(.components)
        }
      }
    }
  }
  .environmentObject(coordinator)
  }
}