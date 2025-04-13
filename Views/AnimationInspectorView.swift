// 
// AniimationInspectorView.swift
// SwiftScape
//
// Created by Alejandro Beltrán on 1/13/25.
//

import SwiftUI
import UIKit

struct AnimationInspectorView: View {
    @Binding var animation: Animation?
    @ObservedObject var canvasModel: CanvasViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Animation")
                .font(.headline)
            
            Picker("Type", selection: Binding(
                get: { animation?.type ?? .fade },
                set: { animation = Animation(type: $0, delay: 0, repeatCount: 1) }
            )) {
                Text("Fade").tag(Animation.AnimationType.fade)
                Text("Scale").tag(Animation.AnimationType.scale)
                Text("Slide").tag(Animation.AnimationType.slide)
                Text("Rotate").tag(Animation.AnimationType.rotate)
                Text("Bounce").tag(Animation.AnimationType.bounce)
            }
            
            Slider(value: Binding(
                get: { animation?.delay ?? 0 },
                set: { animation?.delay = $0 }
            ), in: 0...2)
            
            Stepper("Repeat: \(animation?.repeatCount ?? 1)", value: Binding(
                get: { animation?.repeatCount ?? 1 },
                set: { animation?.repeatCount = $0 }
            ), in: 1...10)
        }
    }
}

extension View {
  func applyAnimation(_ animation: Animation?) -> some View {
    self.modifier(AnimationModifier(animation: animation))
  }
}

struct AnimationModifier: ViewModifier {
    let animation: Animation?
    @State private var isAnimating = false

    func body(content: Content) -> some View {
        content 
            .opacity(isAnimatig && animation?.type == .fade ? 0 : 1)
            .scaleEffect(isAnimating && animation?.type == .scale ? 0 : 1)
            .rotationEffect(isAnimating && animation?.type == .rotate ? .degrees(360) : .degrees(0))
            .offset(x: isAnimating && animation?.type == .bounce ? -20 : 0)
            .animation(
                .easeInOut(duration: animation?.type.duration ?? 0.5)
                .delay(animation?.delay ?? 0)
                .repeatCount(animation?.repeatCount ?? 1),
            value: isAnimating
            )
            .onAppear {
                isAnimating = true
            }
    }
}
