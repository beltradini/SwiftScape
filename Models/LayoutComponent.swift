// 
// LayoutComponent.swift
// SwiftScape
// 
// Created by Alejandro Beltrán on 1/13/25.
// 

import SwiftUI

struct LayoutComponent: UIComponent {
    var id = UUID()
    var position: CGPoint
    var size: CGSize
    var zIndex: Int
    var backgroundColor: Color
    var isResizable: Bool
    var name: String = "Layout"
    var propiedades: [String: Any] = [:]
    var children: [UIComponent] = []
    var isModule: Bool = false
    
    func generateSwiftCode() -> String {
      let childrenCode = children.map { $0.generateSwiftCode() }.joined(separator: "\n")
      return """
        VStack {
            \(childrenCode)
        }
        """
        
    }
    
    func render() -> AnyView {
        AnyView(
            VStack {
                ForEach(children, id: \.id) { child in
                    child.render()
                }
            }
            .frame(width: size.width, height: size.height)
            .background(backgroundColor)
        )
    }
}