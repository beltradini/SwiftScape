//
//  ButtonComponent.swift
//  SwiftScape
//
//  Created by Alejandro Beltrán on 1/11/25.
//

import SwiftUI
import UIKit

struct ButtonComponent: UIComponent {
    var id = UUID()
    var position: CGPoint
    var size: CGSize
    var zIndex: Int
    var backgroundColor: Color
    var isResizable: Bool
    var title: String // Text displayed on the button
    var actionCode: String // Action to be executed on tap
    var textColor: Color
    var fontSize: CGFloat
    var text: String
    var name: String = "Button"
    var propiedades: [String: Any] = [:]
    var children: [any UIComponent] = []
    var isModule: Bool = false
    
    func generateSwiftCode() -> String {
        let title = propiedades["title"] as? String ?? "Press Me"
        return "Button(action: { \(actionCode) }) { Text(\"\(title)\") }"
    }
    
    func render() -> AnyView {
        AnyView(
            Text(title)
                .frame(width: size.width, height: size.height)
                .background(backgroundColor)
                .cornerRadius(8)
        )
    }
}
