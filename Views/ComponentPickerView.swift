//
//  ComponentPickerView.swift
//  SwiftScape
//
//  Created by Alejandro Beltrán on 1/11/25.
//

import SwiftUI

struct ComponentPickerView: View {
    @ObservedObject var canvasModel: CanvasModel
    @Environment(\.presentationManager) var presentationManager
    
    /// Available components that can be added to the canvas
    private let availableComponents: [String] = [
        "Button",
        "Label",
        "Image",
        "Module"
    ]

    /// State for component selection mode
    @State private var isSelectionMode = false
    /// Set of selected component IDs
    @State private var selectedComponents: Set<UUID> = []

    var body: some View {
        NavigationView {
            VStack {
                if isSelectionMode {
                    if canvasModel.components.isEmpty {
                        ContentUnavailableView(
                            "No Components",
                            systemImage: "square.stack",
                            description: Text("Add some components first")
                        )
                    } else {
                        List(canvasModel.components, id: \.id) { component in
                            HStack {
                                Text(component.name)
                                Spacer()
                                Image(systemName: selectedComponents.contains(component.id) ? 
                                      "checkmark.circle.fill" : "circle")
                            }
                            .contentShape(Rectangle())
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.2)) {
                                    if selectedComponents.contains(component.id) {
                                        selectedComponents.remove(component.id)
                                    } else {
                                        selectedComponents.insert(component.id)
                                    }
                                }
                            }
                        }
                    }
                } else {
                    // ...existing code...
                }
            }
            .navigationTitle(isSelectionMode ? "Select Components" : "Add Component")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    if isSelectionMode && !canvasModel.components.isEmpty {
                        Button(selectedComponents.count == canvasModel.components.count ? "Deselect All" : "Select All") {
                            withAnimation {
                                if selectedComponents.count == canvasModel.components.count {
                                    selectedComponents.removeAll()
                                } else {
                                    selectedComponents = Set(canvasModel.components.map { $0.id })
                                }
                            }
                        }
                    }
                    Button(isSelectionMode ? "Cancel" : "Select") {
                        withAnimation {
                            isSelectionMode.toggle()
                            selectedComponents.removeAll()
                        }
                    }
                }
            }
        }
    }
}