//
//  CanvasView.swift
//  SwiftScape
//
//  Created by Alejandro Beltrán on 1/11/25.
//

import SwiftUI

struct CanvasView: View {
    @StateObject private var canvasModel = CanvasModel()
    @State private var selectedComponentId: UUID? // Selected component in the Canva
    @State private var isShowingPicker: Bool = false
    @ObservedObject var canvasModel1: CanvasViewModel
    
    var body: some View {
        ZStack {
            ForEach(canvasModel1.components) { components in
                components.render()
                    .position(x: components.position.x, y: components.position.y)
                    .onTapGesture {
                        canvasModel1.selectedComponent(component)
                    }
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                if let index = canvasModel1.components.firstIndex(of: components) {
                                    canvasModel1.components[index].position.x = value.location.x
                                    canvasModel1.components[index].position.y = value.location.y
                                }
                            }
                        )
            }
        }
        .background(Color(UIColor.systemGray5))
        .cornerRadius(8)
        .shadow(radius: 4)
        
        ZStack {
            // Canva Background
            Color.gray.opacity(0.2)
                .ignoresSafeArea()
            
            // Rederizar los componentes en el lienzo
            ForEach(canvasModel.components) { component in
                renderComponent(component)
                    .position(component.position)
                    .frame(width: component.size.width, height: component.size.height)
                    .zIndex(Double(component.zIndex))
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                // Mover componente
                                canvasModel.updatePosition(for: component.id, to: value.location)
                            }
                    )
                    .overlay(
                        // Resaltado de selección
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(
                                selectedComponentId == component.id ? Color.red : Color.clear,
                                lineWidth: 2
                            )
                    )
                    .onTapGesture {
                        selectedComponentId = component.id // Seleccionar componente
                    }
            }
            
            // Botón para agregar un ejemplo de componente
            VStack {
                Spacer()
                Button(action: addExampleComponent) {
                    Text("Add Component")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(8)
                }
                .padding()
            }
            VStack {
                Spacer()
                Button(action: {
                    isShowingPicker = true
                }) {
                    Text("Add Component")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(8)
                }
                .padding()
                .sheet(item: $isShowingPicker) {
                    ComponentPickerView(canvasModel: canvasModel)
                }
            }
            HStack {
                // Lienzo
                CanvasView(canvasModel: canvasModel)
                
                // Inspector
                InspectorView(canvasModel: canvasModel)
            }
        }
    }
    // Genera una vista para el componente proporcionado
    @ViewBuilder
    private func renderComponent(_ component: any UIComponent) -> some View {
        switch component {
            case let button as ButtonComponent:
                Button(action: {
                    print(button.actionCode)
                }) {
                    Text(button.title)
                        .padding()
                        .background(button.backgroundColor)
                        .cornerRadius(8)
                }
            case let label as LabelComponent:
                Text(label.text)
                    .font(.system(size: label.fontSize))
                    .foregroundStyle(label.textColor)
                    .background(label.backgroundColor)
            case let image as ImageComponent:
                Image(image.imageName)
                    .resizable()
                    .aspectRatio(contentMode: image.contentMode)
                    .cornerRadius(image.cornerRadius)
            default:
                EmptyView()
        }
    }
    
    // Agregar un componente de ejemplo al lienzo
    private func addExampleComponent() {
        let newButton = ButtonComponent (
            position: CGPoint(x: 150, y: 300),
            size: CGSize(width: 150, height: 50),
            zIndex: 1,
            backgroundColor: .blue,
            isResizable: true,
            title: "Example Button",
            actionCode: "print(\"Button Pressed\")",
            textColor: .white,
            fontSize: 20,
            text: "Example Button"
        )
        canvasModel.addComponent(newButton)
    }
}
