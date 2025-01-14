//
//  ComponentViewModel.swift
//  SwiftScape
//
//  Created by Alejandro Beltrán on 1/11/25.
//

import SwiftUI
import UIKit

/// ViewModel for managing individual UIComponent propierties
class ComponentViewModel: ObservableObject {
    @Published var id: UUID
    @Published var position: CGPoint
    @Published var size: CGSize
    @Published var backgroundColor: Color
    @Published var text: String
    @Published var fontSize: CGFloat
    @Published var cornerRadius: CGFloat
    
    // Initialization with default or provided values
    init(
        id: UUID = UUID(),
        position: CGPoint = CGPoint(x: 0, y: 0),
        size: CGSize = CGSize(width: 100, height: 50),
        backgroundColor: Color = .gray,
        text: String = "Hello World",
        fontSize: CGFloat = 20,
        cornerRadius: CGFloat = 10
    ) {
        self.id = id
        self.position = position
        self.size = size
        self.backgroundColor = backgroundColor
        self.text = text
        self.fontSize = fontSize
        self.cornerRadius = cornerRadius
    }
    
    // Updates a property of the component
    func updateProperty<T>(_ keyPath: WritableKeyPath<ComponentViewModel, T>, value: T) {
        self[keyPath: keyPath] = value
    }
    
    // Generates SwiftUI code for this component
    func generateCode() -> String {
        return """
        Text("\(text)")
            .frame(width: \(size.width), height: \(size.height))
            .background(Color(\(backgroundColor.description)))
            .font(.system(size: \(fontSize)))
            .cornerRadius(\(cornerRadius))
            .position(x: \(position.x), y: \(position.y))
        """
    }
}

