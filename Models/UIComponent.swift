//
//  UIComponent.swift
//  SwiftScape
//
//  Created by Alejandro Beltrán on 1/11/25.
//

import SwiftUI
<<<<<<< Updated upstream
import UIKit
=======
>>>>>>> Stashed changes

protocol UIComponent: Identifiable {
    var id: UUID { get } // Unique identifiquer for each component
    var position: CGPoint { get set } // Position on the canvas
    var size: CGSize { get set } // Size of the component
    var zIndex: Int { get set } // Layer order for stracking components
    var backgroundColor: Color { get set } // Background color
    var isResizable: Bool { get } // Whether the component is resizable
    var textColor: Color { get }
    var fontSize: CGFloat { get }
    var text: String { get }
    var imageName: String { get }
    var cornerRadius: CGFloat { get }
    var contentMode: ContentMode { get }
<<<<<<< Updated upstream
    // Future improvements: Advanced Code Generator 
    var name: String { get set } // Name of the component 
    var propiedades: [String: Any] { get set } // Properties of the component
    var children: [any UIComponent] { get set } // Child components
    var isModule: Bool { get set } // Whether the component is a module or not
    var animation: Animation { get set } // Animation for the component
    
    // Generate SwiftUI code this component
    func generateSwiftCode() -> String
    func generateModuleCode() -> String // Generate SwiftUI code for a module
    func render() -> AnyView // Render the component

}

// Responsive Size for the components
func responsiveSize(for screenSize: ScreenSize) -> CGSize {
    ResponsiveLayout.adaptedSize(self.size, for: screenSize)
}

func responsivePosition(for screenSize: ScreenSize) -> CGPoint {
    let scale = ResponsiveLayout.scale(for: screenSize)
    return CGPoint(x: self.position.x * scale, y: self.position.y * scale)
}

extension UIComponent {
    func generateModuleCode() -> String {
        // Default implementation
        return generateSwiftCode()
    }
=======
    
    // Generate SwiftUI code this component
    func generateSwiftCode() -> String
>>>>>>> Stashed changes
}

extension Color {
    var swiftUIColorCode: String {
        // Example: Converts Color .blue to ".blue" and custom colors to RGBA
        if self == .blue { return ".blue" }
        if self == .red { return ".red" }
        if self == .green { return ".green" }
        // Add more predefined colors as needed
        return ".clear" // Fallback for custom colors
    }
}

extension ContentMode {
    var swiftContentModeCode: String {
        switch self {
            case .fit: return ".fit"
            case .fill: return ".fill"
            @unknown default: return ".fit"
        }
    }
}
<<<<<<< Updated upstream

// Generador de Código Modular!
class ModularCodeGenerator {
    func generateCode(from components: [any UIComponent]) -> String {
        var code = ""

        for component in components {
            if component.isModule {
            // Generate code for each component
            code += component.generateModuleCode(for: component)
        } else {
            // Generate from part of the principal design
            code += component.generateSwiftCode() + "\n"
            }
        }
        return code
    }

    func generateModuleCode(for component: any UIComponent) -> String {
        var moduleCode = ""

        moduleCode += "struct \(component.name): View {\n"
        moduleCode += "var body: some View {\n"
        moduleCode += "   \(component.generateSwiftCode())\n"
        moduleCode += "}\n"
        moduleCode += "}\n\n"

        return moduleCode
    }
}
=======
>>>>>>> Stashed changes
