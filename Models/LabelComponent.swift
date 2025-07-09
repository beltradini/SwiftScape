//
//  LabelComponent.swift
//  SwiftScape
//
//  Created by Alejandro Beltrán on 1/11/25.
//

import SwiftUI
<<<<<<< Updated upstream
import UIKit

struct LabelComponent: UIComponent {
    var imageName: String
    var cornerRadius: CGFloat
    var contentMode: ContentMode
=======

struct LabelComponent: UIComponent {
>>>>>>> Stashed changes
    var id = UUID()
    var position: CGPoint
    var size: CGSize
    var zIndex: Int
    var backgroundColor: Color
    var isResizable: Bool
    var text: String
    var fontSize: CGFloat
    var textColor: Color
<<<<<<< Updated upstream
    var name: String = "Label"
    var propiedades: [String: Any] = [:]
    var children: [any UIComponent] = []
    var isModule: Bool = false
    
    func generateSwiftCode() -> String {
        let content = propiedades["content"] as? String ?? "Hello, World!"
        return "Text(\"\(content)\")"
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
}
