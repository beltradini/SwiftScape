//
//  InspectorView.swift
//  SwiftScape
//
//  Created by Alejandro Beltrán on 1/11/25.
//

import SwiftUI
<<<<<<< Updated upstream
import UIKit
=======
>>>>>>> Stashed changes

struct LabelInspectedView: View {
    @ObservedObject var label: LabelComponent
    @ObservedObject var canvasModel: CanvasModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Label Properties")
                .font(.subheadline)
            
            Text("Text")
            TextField("Label Text", text: Binding(
                get: { label.text },
                set: { label.text = $0; canvasModel.update(label) }
            ))
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Text("Font Size")
            TextField("Font Size", value: Binding(
                get: { label.fontSize },
                Set: { label.fontSize = $0; canvasModel.update(label) }
            ), formatter: NumberFormatter())
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Text("Text Color")
            ColorPicker("Pick a color", selection: Binding(
                get: { label.textColor },
                set: { label.textColor = $0; canvasModel.update(label) }
            ))
<<<<<<< Updated upstream

            Divider() 

            // Module Toggle 
            Toggle(isOn: Binding(
                get: { label.isModule },
                set: { newValue in 
                    label.isModule = newValue
                    canvasModel.update(label)
                    
                    // If becoming a module, update properties
                    if newValue {
                        label.name = "Module_" + label.name
                        label.propiedades["isModule"] = true
                    }
                }
            )) {
                Text("Convert to Module")
                    .font(.subheadline)
            }
            .padding(.vertical, 8)

            if label.isModule {
                TextField("Module Name", text: Binding(
                    get: { label.name },
                    set: { label.name = $0; canvasModel.update(label) }
                ))
                .textFieldStyle(RoundedBorderTextFieldStyle())
            }
=======
>>>>>>> Stashed changes
        }
    }
}

struct ImageInsperctorView: View {
    @ObservedObject var image: ImageComponent
    @ObservedObject var canvasModel: CanvasModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Image Properties")
                .font(.subheadline)
            
            Text("Image")
            TextField("Pick an image", text: Binding(
                get: { image.imageName },
                set: { image.imageName = $0; canvasModel.update(image) }
            ))
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Text("Corner Radius")
            TextField("Corner Radius", value: Binding(
                get: { image.cornerRadius },
                set: { image.cornerRadius = $0; canvasModel.update(image) }
            ), formatter: NumberFormatter())
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

struct InspectorView: View {
    @ObservedObject var component: ComponentViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Inspector").font(.headline)
            
            Group {
                Text("Position")
                HStack {
                    Text("X:")
                    TextField("", value: $component.position.x, formatter: NumberFormatter())
                    Text("Y:")
                    TextField("", value: $component.position.y, formatter: NumberFormatter())
                }
            }

            Group {
                Text("Size")
                HStack {
                    Text("Width:")
                    TextField("", value: $component.size.width, formatter: NumberFormatter())
                    Text("Height:")
                    TextField("", value: $component.size.height, formatter: NumberFormatter())
                }
            }

            Group {
                Text("Background Color")
                ColorPicker("Pick a color", selection: $component.backgroundColor)
            }

            Group {
                Text("Text")
                TextField("Text", text: $component.text)
                Text("Font Size")
                TextField("", value: $component.fontSize, formatter: NumberFormatter())
            }

            Group {
                Text("Corner Radius")
                TextField("", value: $component.cornerRadius, formatter: NumberFormatter())
            }
        }
        .padding()
        .background(Color(UIColor.systemGray6))
        .cornerRadius(8)
    }
}
