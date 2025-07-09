//
//  ButtonComponent.swift
//  SwiftScape
//
//  Created by Alejandro Beltrán on 1/11/25.
//

import SwiftUI
<<<<<<< Updated upstream
import UIKit

struct ButtonComponent: UIComponent {
    var imageName: String
    var cornerRadius: CGFloat
    var contentMode: ContentMode
=======

struct ButtonComponent: UIComponent {
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
    var name: String = "Button"
    var propiedades: [String: Any] = [:]
    var children: [any UIComponent] = []
    var isModule: Bool = false
    
    func generateSwiftCode() -> String {
        let title = propiedades["title"] as? String ?? "Press Me"
        return "Button(action: { \(actionCode) }) { Text(\"\(title)\") }"
=======
    
    func generateSwiftCode() -> String {
        """
                Text("\(text)")
                    .font(.system(size: \(fontSize)))
                    .foregroundColor(\(textColor.swiftUIColorCode))
                    .frame(width: \(size.width), height: \(size.height))
                    .background(\(backgroundColor.swiftUIColorCode))
                """
>>>>>>> Stashed changes
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
