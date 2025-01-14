// 
// ModuleComponent.swift
// SwiftScape
// Created by Alejandro Beltrán on 1/13/25.
//

import SwiftUI

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
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.blue, style: StrokeStyle(lineWidth: 2, dash: [5]))
                    .frame(width: size.width, height: size.height)
                ForEach(children, id: \.id) { child in
                    child.render()
                }
            }
        )
    }
}
