//
//  ComponentPickerView.swift
//  SwiftScape
//
//  Created by Alejandro Beltrán on 1/11/25.
//

import SwiftUI

struct ComponentPickerView: View {
    @ObservedObject var canvasModel: CanvasModel
    @Environment(\.presentationManager) var presentationManager
    
    // Avilable Components
    private let avialableComponents: [String] = [
        "Button",
        "Label",
        "Image"
    ]
    
    // Propiedad para gestionar el componente seleccinado
    @State private var selectedComponent: String? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                List(avialableComponents, id: \.self) { component in
                    HStack {
                        Text(component)
                            .font(.headline)
                        Spacer()
                        Button("Add") {
                            addComponent(named: component)
                        }
                        .padding(5)
                        .background(Color .blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(5)
                    }
                }
                .listStyle(InsetGroupedListStyle())
                .navigationTitle("Add Component")
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            PresentationMode.wrappedValue.dismiss()
                        }
                    }
                }
            }
        }
    }
    
    // Agrega un componente al lienzo
    private func addComponent(named name: String) {
        switch name {
        case "Button":
                let button = ButtonComponent(
                    position: CGPoint(x: 100, y: 100),
                    size: CGSize(width: 150, height: 50),
                    zIndex: 1,
                    backgroundColor: .blue,
                    isResizable: true,
                    title: "New Button",
                    actionCode: "print(\"Button Pressed\")"
                )
                canvasModel.addComponent(button)
            case "Label":
                let label = LabelComponent(
                    position: CGPoint(x: 100, y: 100),
                    size: CGSize(width: 200, height: 50),
                    zIndex: 1,
                    text: "New Label",
                    fontSize: 16,
                    textColor: .black,
                    backgroundColor: .clear
                )
                canvasModel.addComponent(label)
            case "Image":
                let image = ImageComponent(
                    position: CGPoint(x: 100, y: 100),
                    size: CGSize(width: 200, height: 200),
                    zIndex: 1,
                    imageName: "image",
                    contentMode: .fit,
                    cornerRadius: 8,
                    isResizable: true
                )
                canvasModel.addComponent(image)
            default:
                break
        }
        PresentationMode.wrappedValue.dismiss()
    }
}
