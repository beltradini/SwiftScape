# SwiftScape

SwiftScape is an interactive tool developed in SwiftUI that allows users to intuitively build custom user interfaces. It enables designers and developers to generate SwiftUI code from visual components, accelerating UI creation and integration into existing projects.

## Key Features

- **Drag-and-drop interface** for building layouts on an interactive canvas.
- **Visual property inspector** to modify colors, sizes, and text attributes.
- **SwiftUI code generation** for immediate integration into your projects.
- **Live preview** of the generated code.
- **Reusable components** including:
  - Buttons
  - Text elements
  - Containers (HStack, VStack, ZStack)
  - Input fields (TextField)

## Code Examples

### Custom Button Example
```swift
Button(action: {
    print("Button pressed")
}) {
    Text("Press Me")
        .padding()
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(8)
}
```

### VStack Example with Text and Button
```swift
VStack {
    Text("Welcome to SwiftScape")
        .font(.title)
        .padding()

    Button(action: {
        print("Start")
    }) {
        Text("Start")
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(8)
    }
}
```

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/beltradini/SwiftScape.git
   ```

2. Open the project in Xcode:
   ```bash
   open SwiftScape.xcodeproj
   ```

3. Choose a simulator or device and run the app.

## Usage

1. Launch the application.
2. Use the canvas to add and arrange UI components.
3. Customize each component using the visual editor.
4. Generate SwiftUI code with the **"Generate Code"** button.
5. Export the code to integrate into your own Swift projects.

## Project Structure

- **CanvasView**: Main interface for component layout.
- **CanvasViewModel**: Logic for managing components and generating code.
- **CodePreviewView**: Displays generated SwiftUI code and enables export.
- **Custom Components**: All conform to the `UIComponent` protocol.

## Technologies Used

- **SwiftUI** for UI development.
- **MVVM architecture** for clean separation of logic and views.
- **Xcode** as the development environment.

## Planned Features

- Enhanced code generator with modular view support.
- Compatibility across watchOS, iPadOS, and visionOS.
- iCloud integration for design sync.
- Siri-based UI creation.
- Additional components:
  - Sliders, pickers, and animations.
  - Undo/redo history.
  - Multi-view project export.

## Contributing

Contributions are welcome. Please open an issue or submit a pull request if you have suggestions or improvements.

## License

This project is licensed under the MIT License. See the [MIT License](https://opensource.org/license/mit) for more information.

## Author

Developed by [Alejandro Beltrán](https://github.com/beltradini).

If you find SwiftScape helpful, please consider starring the repository on GitHub.
