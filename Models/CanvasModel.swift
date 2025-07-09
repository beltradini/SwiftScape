//
//  CanvasModel.swift
//  SwiftScape
//
//  Created by Alejandro Beltrán on 1/11/25.
//

import SwiftUI
<<<<<<< Updated upstream
import UIKit
=======
>>>>>>> Stashed changes

// A model representing the canvas and its components
class CanvasModel: ObservableObject {
    @Published var components: [any UIComponent] = [] // List of all components on the canvas
<<<<<<< Updated upstream

    // Updates a component on the canvas
    func update(_ component: any UIComponent) {
        if let index = components.firstIndex(where: { $0.id == component.id }) {
            components[index] = component
        }

        // If component is a now a module, update its properties
        if component.isModule {
            // Add module-specific styling
            components[index].backgroundColor = .blue
            components[index].isResizable = false
        }
    }
=======
>>>>>>> Stashed changes
    
    // Add a new component to the canvas
    func addComponent(_ component: any UIComponent) {
        components.append(component)
    }
    
    // Removes a component from the canvas by its ID
    func removeComponent(withId id: UUID) {
        components.removeAll() { $0.id == id }
    }
    
    // Moves a component to a new position
    func updatePosition(for componentId: UUID, to newSize: CGSize) {
        if let index = components.firstIndex(where: { $0.id == componentId }) {
            components[index].position = newPosition
        }
    }
    
    // Resizes a component
    func updateSize(for componentId: UUID, to newSize: CGSize) {
        if let index = components.firstIndex(where: { $0.id == componentId }) {
            components[index].size = newSize
        }
    }
    
    // Updates the zIndex of a component for layering
    func updateZIndex(for componentId: UUID, to newZIndex: Int) {
        if let index = components.firstIndex(where: { $0.id == componentId}) {
            components[index].zIndex = newZIndex
        }
    }
    
    // Generate SwiftUI code for all components on the canvas
    func generateCanvasSwiftUICode() -> String {
        components
            .sorted(by: { $0.zIndex < $1.zIndex }) // Ensure correct redering order
<<<<<<< Updated upstream
            .map { $0.generateSwiftCode() }
=======
            .map { $0.generateSwiftUICode() }
>>>>>>> Stashed changes
            .joined(separator: "n/n")
    }
}
