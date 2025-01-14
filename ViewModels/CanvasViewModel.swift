//
//  CanvasViewModel.swift
//  SwiftScape
//
//  Created by Alejandro Beltrán on 1/11/25.
//

import SwiftUI
import UIKit

// ViewModel for managing components in the canvas and generating SwiftUI code.
class CanvasViewModel: ObservableObject {
    @Published var components: [UIComponent] = []
    @Published var selectedComponent: (UIComponent)? = nil
    @Published var moduleTemplates: [ModuleComponent] = []
    
    // MARK: - Methods to Manage Components
    
    /// Adds a new components to the canvas
    func addComponent(_ component: UIComponent) {
        components.append(component)
        selectedComponent(component)
    }
    
    /// Removes a component from the canvas.
    func removeComponent(_ component: UIComponent) {
        components.removeAll { $0.id == component.id }
        if selectedComponent?.id == component.id {
            selectedComponent = nil
        }
    }
    
    /// Moves a component to a new position in the list.
    func moveComponent(from source: IndexSet, to destination: Int) {
        components.move(fromOffsets: source, toOffset: destination)
    }
    
    /// Selects a component for editing.
    func selectedComponent(_ component: UIComponent?) {
        selectedComponent = component
    }
    
    // MARK: - Code Generation
    
    /// Generates the SwiftUI code based on the curent components in the canvas.
    func generateCode() -> String {
        var code = "import SwiftUI\n\nstruct GeneratedView: View {\n    var body: some View {\n        ZStack {\n"
        
        for component in components {
            code += "            \(component.generateCode())\n"
        }
        
        code += "        }\n    }\n}\n\nstruct GeneratedView_Previews: PreviewProvider {\n    static var previews: some View {\n        GeneratedView()\n    }\n}"
        return code
    }
    
    // Add component
    func addComponent(position: CGPoint = CGPoint(x: 100, y: 100)) {
        let newComponent = ComponentViewModel (
            position: position,
            size: CGSize(width: 120, height: 50),
            backgroundColor: .blue,
            text: "Hello World!"
        )
        components.append(newComponent)
    }

    // Reusable Module Implementation
    func saveAsModuleTemplate(_ module: ModuleComponent) {
        moduleTemplates.append(module)
    }

    func createModuleInstance(from templateId: UUID) -> ModuleComponent? {
        guard let template = moduleTemplates.first(where: { $0.id == templateId }) else {
            return nil
        }
        return template.cloneAsInstance()
    }
}
