//
//  InmersiveView.swift
//  SwiftScape
//
//  Created by Alejandro Beltrán on 1/31/25.
//

import SwiftUI
import RealityKit
import ReplayKit

struct InmersiveView: View {
    @State private var isRecording = false
    private let recorder = RPScreenRecorder.shared()
    
    var body: some View {
        VStack {
            RealityView { content in
                do {
                    let entity = try await Entity(named: "3DModel.usdz")
                    content.add(entity)
                } catch {
                    print("Error loading model: \(error)")
                }
            }
            .frame(height: 300)
            
            HStack(spacing: 20) {
                Button(action: startRecording) {
                    Label("Start Recording", systemImage: "record.circle")
                        .foregroundStyle(.red)
                }
                .disabled(isRecording)
                
                Button(action: stopRecording) {
                    Label("Stop Recording", systemImage: "stop.circle")
                        .foregroundStyle(.blue)
                }
                .disabled(!isRecording)
            }
            .padding()
        }
    }
    
    // MARK: - ReplayKit
    func startRecording() {
        guard recorder.isAvailable else {
            print("Recording not available")
            return
        }
        
        recorder.startRecording { error in
            if let error = error {
                print("Error starting recording: \(error)")
            } else {
                self.isRecording = true
                print("Recording started.")
            }
        }
    }
    
    func stopRecording() {
        recorder.stopRecording { previewVC, error in
            isRecording = false
            
            if let error = error {
                print("Error stopping recording: \(error)")
            }
            
            if let previewVC = previewVC {
                if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                   let root = scene.windows.first?.rootViewController {
                    previewVC.modalPresentationStyle = .fullScreen
                    root.present(previewVC, animated: true)
                }
            }
        }
    }
}
