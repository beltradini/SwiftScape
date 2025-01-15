// 
// ResponsiveLayout.swift
// SwiftScape
//
// Created by Alejandro Beltrán on 1/14/25
//

import SwiftUI
import UIKit

struct ResponsiveLayout {
  static func scale(for screenSize: ScreenSize) -> CGFloat {
    switch screenSize {
      case .small: return 0.8
      case .medium: return 1.0
      case .large: return 1.2
      case .xlarge: return 1.5
    }
  }

  static func adaptedSize(_ size: CGSize, for screenSize: ScreenSize) -> CGSize {
    let scale = self.scale(for: screenSize)
    return CGSize(width: size.width * scale, height: size.height * scale)
  }
}