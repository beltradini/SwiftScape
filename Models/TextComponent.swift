//
// TextComponent.swift
// SwiftScape
//
// Created by Alejandro Beltrán on 1/13/25.
// 

import SwiftUI

struct TextComponent: UIcomponent {
    var id = UUID()
    var position: CGPoint
    var size: CGSize
    var zIndex: Int
    var backgroundColor: Color
    var isResizable: Bool
    var textColor: Color
    var fontSize: CGFloat
    var text: String
    var name: String = "Text"
    var propiedades: [String: Any] = [:]
    var children: [UIComponent] = []
    var isModule: Bool = false
    
    func generateSwiftCode() -> String {
        let content = propiedades["content"] as? String ?? "Hello, World!"  
        return "Text(\"\(content)\")"
    }
    
    func render() -> AnyView {
        AnyView(
            Text(text)
                .frame(width: size.width, height: size.height)
                .background(backgroundColor)
                .foregroundColor(textColor)
                .font(.system(size: fontSize))
        )
    }
}