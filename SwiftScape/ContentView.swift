//
//  ContentView.swift
//  SwiftScape
//
//  Created by Alejandro Beltrán on 1/11/25.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @StateObject private var canvasModel = CanvasViewModel()
    
    var body: some View {
        VStack {
            // Canvas Area
            CanvasView(canvasModel1: canvasModel)
                .frame(maxHeight: 400)
                .padding()
            
            // Action Buttons
            HStack {
                Button("Add Button") {
                    let button = ButtonComponent(position: CGPoint(x: 100, y: 100), size: CGSize(width: 120, height: 50), zIndex: 1, backgroundColor: .blue, isResizable: true, title: "New Button")
                    canvasModel.addComponent(button)
                }
            }
            
            Button("Remove Selected") {
                if let selected = canvasModel.selectedComponent {
                    canvasModel.removeComponent(selected)
                }
            }
            
            Button("Generate Code") {
                let code = canvasModel.generateCode()
                print(code) // Export or display the code
            }
        }
        .padding()
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Add Siri Shortcuts")
                SiriButtonView()
                    .frame(width: 100, height: 100)
            }
            .navigationTitle("SwiftScape")
        }
    }
}

#Preview {
    ContentView()
}
