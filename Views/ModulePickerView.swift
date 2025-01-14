// 
// ModulePickerView.swift
//  SwiftScape
//
// Created by Alejandro Beltrán on 1/14/25.
// 

import SwiftUI

struct ModulePicker: View {
    @ObservedObject var canvasModel: CanvasViewModel
    
    var body: some View {
        List(canvasModel.moduleTemplates, id: \.id) { template in
            HStack {
                Text(template.name)
                Spacer()
                Button("Add") {
                    if let instance = canvasModel.createModuleInstance(from: template.id) {
                        canvasModel.components.append(instance)
                    }
                }
            }
        }
    }
}