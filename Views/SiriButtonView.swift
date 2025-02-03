// 
// SiriButtonView.swift
// SwiftScape 
//
// Created by Alejandro Beltrán on 2/3/25.
//

// SwiftUI view that displays a Siri button.
import SwiftUI
import IntentsUI

struct SiriButtonView: UIViewControllerrRepresentable {
  func makeUIViewController(context: Context) -> INUIAddVoiceShortcutViewController {
    let intent = ShowDesignIntent()
    let shortcut = INShortcut(intent: intent)
    let vc = INUIAddVoiceShortcutViewController(shortcut: shortcut)
    vc.delegate = context.coordinator
    return vc
  }

  func updateUIViewController(_ uiViewController: INUIAddVoiceShortcutViewController, context: Context) { }

  func makeCoordinator() -> Coordinator {
    Coordinator()
  }

  class Coordinator: NSObject, INUIAddVoiceShortcutViewControllerDelegate {
    func addVoiceShortcutViewController(_ controller: INUIAddVoiceShortcutViewController, didFinishWith voiceShortcut: INVoiceShortcut?, error: Error?) {
      controller.dismiss(animated: true, completion: nil)
    }

    func addVoiceShortcutViewControllerDidCancel(_ controller: INUIAddVoiceShortcutViewController) {
      controller.dismiss(animated: true, completion: nil)
    }
  }
}
