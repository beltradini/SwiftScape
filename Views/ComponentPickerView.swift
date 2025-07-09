//
//  ComponentPickerView.swift
//  SwiftScape
//
//  Created by Alejandro Beltrán on 1/11/25.
//

import SwiftUI
<<<<<<< Updated upstream
import UIKit
=======
>>>>>>> Stashed changes

struct ComponentPickerView: View {
    @ObservedObject var canvasModel: CanvasModel
    @Environment(\.presentationManager) var presentationManager
    
<<<<<<< Updated upstream
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
=======
    // Avilable Components
    private let avialableComponents: [String] = [
        "Button",
        "Label",
        "Image"
    ]
    
    // Propiedad para gestionar el componente seleccinado
    @State private var selectedComponent: String? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                List(avialableComponents, id: \.self) { component in
                    HStack {
                        Text(component)
                            .font(.headline)
                        Spacer()
                        Button("Add") {
                            addComponent(named: component)
                        }
                        .padding(5)
                        .background(Color .blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(5)
                    }
                }
                .listStyle(InsetGroupedListStyle())
                .navigationTitle("Add Component")
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            PresentationMode.wrappedValue.dismiss()
>>>>>>> Stashed changes
                        }
                    }
                }
            }
        }
    }
<<<<<<< Updated upstream
=======
    
    // Agrega un componente al lienzo
    private func addComponent(named name: String) {
        switch name {
        case "Button":
                let button = ButtonComponent(
                    position: CGPoint(x: 100, y: 100),
                    size: CGSize(width: 150, height: 50),
                    zIndex: 1,
                    backgroundColor: .blue,
                    isResizable: true,
                    title: "New Button",
                    actionCode: "print(\"Button Pressed\")"
                )
                canvasModel.addComponent(button)
            case "Label":
                let label = LabelComponent(
                    position: CGPoint(x: 100, y: 100),
                    size: CGSize(width: 200, height: 50),
                    zIndex: 1,
                    text: "New Label",
                    fontSize: 16,
                    textColor: .black,
                    backgroundColor: .clear
                )
                canvasModel.addComponent(label)
            case "Image":
                let image = ImageComponent(
                    position: CGPoint(x: 100, y: 100),
                    size: CGSize(width: 200, height: 200),
                    zIndex: 1,
                    imageName: "image",
                    contentMode: .fit,
                    cornerRadius: 8,
                    isResizable: true
                )
                canvasModel.addComponent(image)
            default:
                break
        }
        PresentationMode.wrappedValue.dismiss()
    }
>>>>>>> Stashed changes
}
