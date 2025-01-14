// 
// ModuleComponent.swift
// SwiftScape
// Created by Alejandro Beltrán on 1/13/25.
//

import SwiftUI
import UIKit

struct ModuleComponent: UIComponent {
    var textColor: Color
    var fontSize: CGFloat
    var text: String
    var imageName: String
    var cornerRadius: CGFloat
    var contentMode: ContentMode
    var id = UUID()
    var position: CGPoint
    var size: CGSize
    var zIndex: Int
    var backgroundColor: Color
    var isResizable: Bool
    var title: String
    var propiedades: [String: Any]
    var children: [any UIComponent]
    var isModule: Bool
    var name: String

    func cloneAsInstance() -> ModuleComponent {
        var clone = ModuleComponent(
            textColor: textColor,
            fontSize: fontSize,
            text: text,
            imageName: imageName,
            cornerRadius: cornerRadius, contentMode: contentMode,
            id: UUID(),
            position: position,
            size: size,
            zIndex: zIndex,
            backgroundColor: backgroundColor,
            isResizable: isResizable,
            title: title,
            propiedades: propiedades,
            children: children,
            isModule: isModule,
            name: name
        )
        clone.templateId = self.id
        return clone
    }

    func generateSwiftCode() -> String {
      var code = "struct \(name): View {\n"
        code += "    var body: some View {\n"
        code += "        ZStack {\n"
        for child in children {
            code += "            " + child.generateSwiftCode() + "\n"
        }
        code += "        }\n"
        code += "    }\n"
        code += "}"
        return code
    }

    func render() -> AnyView {
       AnyView(
            ZStack {
                // Module boundary 
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.blue, style: StrokeStyle(lineWidth: 2, dash: [5]))
                    .frame(width: size.width, height: size.height)
                
                // Child components
                ForEach(children, id: \.id) { child in
                    child.render()
                        .position(x: child.position.x, y: child.position.y)
                }

                // Module name 
                Text(name)
                    .font(.caption)
                    .padding(4)
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(4)
                    .position(x: size.width / 2, y: size.height / 2)
            }
        )
    }
}
