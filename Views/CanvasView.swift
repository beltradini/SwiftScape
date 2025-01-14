//
//  CanvasView.swift
//  SwiftScape
//
//  Created by Alejandro Beltrán on 1/11/25.
//

import SwiftUI
struct CanvasView: View {
    @ObservedObject var canvasModel: CanvasViewModel  // Single consistent model
    @State private var selectedComponentId: UUID?
    @State private var isShowingPicker: Bool = false
    @State private var isShowingModulePicker = false
    
    var body: some View {
        ZStack {
            // Background
            Color(UIColor.systemGray5)
                .ignoresSafeArea()
                .onTapGesture {
                    // Deselect when tapping canvas
                    selectedComponentId = nil
                }
            
            // Components
            ForEach(canvasModel.components) { component in
                component.render()
                    .position(x: component.position.x, y: component.position.y)
                    .onTapGesture {
                        selectedComponentId = component.id
                        canvasModel.selectedComponent(component)
                    }
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                guard let index = canvasModel.components.firstIndex(where: { $0.id == component.id }) else { return }
                                
                                // Bound checking
                                let newX = min(max(value.location.x, 0), UIScreen.main.bounds.width)
                                let newY = min(max(value.location.y, 0), UIScreen.main.bounds.height)
                                
                                canvasModel.components[index].position = CGPoint(x: newX, y: newY)
                            }
                    )
                    .selected(selectedComponentId == component.id)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Modules") {
                    isShowingModulePicker.toggle()
                }
            }
        }
        .sheet(isPresented: $isShowingModulePicker) {
            ModulePickerView(canvasModel: canvasModel)
        }
        .cornerRadius(8)
        .shadow(radius: 4)
    }
}

// Add selection modifier
extension View {
    func selected(_ isSelected: Bool) -> some View {
        self.overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(isSelected ? Color.blue : Color.clear, lineWidth: 2)
        )
    }
}