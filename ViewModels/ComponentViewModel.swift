//
//  ComponentViewModel.swift
//  SwiftScape
//
//  Created by Alejandro Beltrán on 1/11/25.
//

import SwiftUI
import UIKit

/// ViewModel for managing individual UIComponent propierties
struct ComponentViewModel {
    var id: UUID = UUID()
    var position: CGPoint = CGPoint(x: 0, y: 0)
    var size: CGSize = CGSize(width: 100, height: 50)
    var backgroundColor: Color = .black
    var text: String = ""
    var fontSize: CGFloat = 20
    var cornerRadius: CGFloat = 10
    
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
    mutating func updateProperty<T>(_ keyPath: WritableKeyPath<ComponentViewModel, T>, value: T) {
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

