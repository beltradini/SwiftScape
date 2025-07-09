<<<<<<< Updated upstream
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
=======
# 🌟 GeneratorUI

GeneratorUI is an interactive tool developed in SwiftUI to create custom user interfaces intuitively. This project is designed to allow users to generate designs and export the necessary SwiftUI code, saving time and facilitating app development.

## ✨ Key Features

- **🎛️ Drag and drop components:** Add and organize UI components on an interactive canvas.
- **🎨 Visual property editor:** Modify properties like colors, sizes, and text directly from the interface.
- **💻 SwiftUI code generation:** Export the created design as a `.swift` file ready for use.
- **🔍 Real-time preview:** Preview the generated code before exporting it.
- **🧩 Included components:**
  - Custom buttons
  - Texts
  - Containers (HStack, VStack, ZStack)
  - Input fields (TextField)

## 🧑‍💻 Code Examples

### Example of a Custom Button
>>>>>>> Stashed changes
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

<<<<<<< Updated upstream
### VStack Example with Text and Button
```swift
VStack {
    Text("Welcome to SwiftScape")
=======
### Example of a Vertical Stack with Text and Button
```swift
VStack {
    Text("Welcome to GeneratorUI")
>>>>>>> Stashed changes
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

<<<<<<< Updated upstream
## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/beltradini/SwiftScape.git
=======
## 📥 Installation

1. Clone this repository to your local machine:
   ```bash
   git clone https://github.com/your_username/GeneratorUI.git
>>>>>>> Stashed changes
   ```

2. Open the project in Xcode:
   ```bash
<<<<<<< Updated upstream
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
=======
   open GeneratorUI.xcodeproj
   ```

3. Select a simulator or physical device and run the application.

## 🛠️ Usage

1. Open the app and use the canvas to add interactive components.
2. Customize the component properties using the inspector.
3. Click **"Generate Code"** to preview the design in SwiftUI format.
4. Export the code to a `.swift` file for integration into your projects.

## 📂 Project Structure

- **`CanvasView`**: Main view where the canvas and components are organized.
- **`CanvasViewModel`**: Model managing the canvas components and generating SwiftUI code.
- **`CodePreviewView`**: View for previewing and exporting the generated code.
- **Custom Components:**
  - Each component implements the `UIComponent` protocol to ensure code generation.

## 🛠️ Technologies Used

- **SwiftUI:** Primary framework for the user interface.
- **MVVM:** Architecture to separate logic from the view.
- **Xcode:** Development environment for macOS and iOS.

## 🚀 Future Improvements

- **🧠 Advanced code generator:** Allow exporting views with more complex configurations and modular code.
- **📱 Cross-platform compatibility:** Support for watchOS, iPadOS, and visionOS.
- **☁️ iCloud storage:** Save designs in the cloud and synchronize across devices.
- **🎙️ Siri integration:** Enable design creation via voice commands.
- **📦 More features:**
  - Support for sliders, pickers, and animations.
  - Drag-and-drop components on the canvas.
  - Change history with undo/redo functionality.
  - Export complete projects with multiple views.

## 🤝 Contributions

Contributions are welcome! If you have ideas or find an issue, feel free to open an issue or submit a pull request.

## 📜 License

This project is licensed under the MIT License. See the [MIT License](https://opensource.org/license/mit) file for details.

## 🙌 Credits

Developed by [Alejandro Beltrán](https://github.com/beltradini).

---

Thank you for using GeneratorUI! If you like the project, don’t forget to ⭐ it on GitHub.

>>>>>>> Stashed changes
