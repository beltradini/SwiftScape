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
    
    // Avilable Components
    private let avialableComponents: [String] = [
        "Button",
        "Label",
        "Image",
        "Module" // Add Module option 
    ]

    // Add new state properties 
    @State private var isSelectionMode = false
    @State private var selectedComponents: Set<UUID> = []

    var body: some View {
        NavigationView {
            VStack {
                if isSelectionMode {
                    // Show selected components list
                    List(canvasModel.components, id: \.id) { component in
                        HStack {
                            Text(component.name)
                            Spacer()
                            Image(systemName: selectedComponents.contains(component.id) ? 
                                  "checkmark.circle.fill" : "circle")
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            if selectedComponents.contains(component.id) {
                                selectedComponents.remove(component.id)
                            } else {
                                selectedComponents.insert(component.id)
                            }
                        }
                    }
                    
                    // Create Module button
                    if !selectedComponents.isEmpty {
                        Button("Create Module") {
                            createModuleFromSelection()
                        }
                        .buttonStyle(.borderedProminent)
                        .padding()
                    }
                } else {
                    // Original component list
                    // ...existing code...
                }
            }
            .navigationTitle(isSelectionMode ? "Select Components" : "Add Component")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(isSelectionMode ? "Cancel" : "Select") {
                        isSelectionMode.toggle()
                        selectedComponents.removeAll()
                    }
                }
            }
        }
    }

    private func createModuleFromSelection() {
        let selectedItems = canvasModel.components.filter { selectedComponents.contains($0.id) }

        let moduleComponent = ModuleComponent(
            position: CGPoint(x: 100, y: 100),
            size: CGSize(width: 300, height: 300),
            zIndex: 1,
            backgroundColor: .clear,
            isResizable: true,
            title: "New Module",
            propiedades: [:],
            children: selectedItems,
            isModule: true
        )

        // Remove selected components and add new module
        canvasModel.components.removeAll { selectedComponents.contains($0.id) }
        canvasModel.addComponent(moduleComponent)

        // Reset selection mode
        isSelectionMode = false
        selectedComponents.removeAll()
        presentationManager.dismiss()
    }


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
                        }
                    }
                }
            }
        }
    }
    
    // Agrega un componente al lienzo
    private func addComponent(named name: String) {
        if component == "Module" {
            createModule()
            return
        }
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
}
