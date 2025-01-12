//
//  ButtonComponent.swift
//  SwiftScape
//
//  Created by Alejandro Beltrán on 1/11/25.
//

import SwiftUI

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
    
    func generateSwiftCode() -> String {
        """
                Text("\(text)")
                    .font(.system(size: \(fontSize)))
                    .foregroundColor(\(textColor.swiftUIColorCode))
                    .frame(width: \(size.width), height: \(size.height))
                    .background(\(backgroundColor.swiftUIColorCode))
                """
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
