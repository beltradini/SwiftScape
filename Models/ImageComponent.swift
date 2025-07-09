//
//  ImageComponent.swift
//  SwiftScape
//
//  Created by Alejandro Beltrán on 1/11/25.
//

import SwiftUI
<<<<<<< Updated upstream
import UIKit
=======
>>>>>>> Stashed changes

struct ImageComponent: UIComponent {
    var id = UUID()
    var position: CGPoint // Position on the canvas
    var size: CGSize // Size of the component
    var zIndex: Int
    var backgroundColor: Color // Background color
    var textColor: Color
    var text: String
    var fontSize: CGFloat
    var isResizable: Bool // Whether the component is resizable
    var imageName: String
    var cornerRadius: CGFloat
    var contentMode: ContentMode
<<<<<<< Updated upstream
    var name: String = "Image"
    var propiedades: [String: Any] = [:]
    var children: [any UIComponent] = []
    var isModule: Bool = false
    
    init(   
=======
    
    init(
>>>>>>> Stashed changes
        position: CGPoint = .zero,
        size: CGSize = CGSize(width: 100, height: 100),
        zIndex: Int = 0,
        backgroundColor: Color = .white,
        isResizable: Bool = false,
        imageName: String = "",
        cornerRadius: CGFloat = 0,
        contentMode: ContentMode = .fit
    ) {
        self.position = position
        self.size = size
        self.zIndex = zIndex
        self.backgroundColor = backgroundColor
        self.isResizable = isResizable
        self.imageName = imageName
        self.cornerRadius = cornerRadius
        self.contentMode = contentMode
        self.textColor = .blue
        self.text = ""
        self.fontSize = 10
    }
    
    func generateSwiftCode() -> String {
<<<<<<< Updated upstream
        let content = propiedades["content"] as? String ?? "Hello, World!"
        return "Image(\"\(content)\")"
=======
        """
                Image("\(imageName)")
                    .resizable()
                    .aspectRatio(contentMode: .\(contentMode == .fit ? "fit" : "fill"))
                    .frame(width: \(size.width), height: \(size.height))
                    .background(\(backgroundColor.swiftUIColorCode))
                    .cornerRadius(\(cornerRadius))
                    .position(x: \(position.x), y: \(position.y))
                """
>>>>>>> Stashed changes
    }
        
}
