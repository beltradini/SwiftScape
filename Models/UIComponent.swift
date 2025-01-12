//
//  UIComponent.swift
//  SwiftScape
//
//  Created by Alejandro Beltrán on 1/11/25.
//

import SwiftUI

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
    
    // Generate SwiftUI code this component
    func generateSwiftCode() -> String
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
