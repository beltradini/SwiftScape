//
//  LabelComponent.swift
//  SwiftScape
//
//  Created by Alejandro Beltrán on 1/11/25.
//

import SwiftUI

struct LabelComponent: UIComponent {
    var id = UUID()
    var position: CGPoint
    var size: CGSize
    var zIndex: Int
    var backgroundColor: Color
    var isResizable: Bool
    var text: String
    var fontSize: CGFloat
    var textColor: Color
    
    func generateSwiftCode() -> String {
        """
                Text("\(text)")
                    .font(.system(size: \(fontSize)))
                    .foregroundColor(\(textColor.swiftUIColorCode))
                    .frame(width: \(size.width), height: \(size.height))
                    .background(\(backgroundColor.swiftUIColorCode))
                """
    }
}
