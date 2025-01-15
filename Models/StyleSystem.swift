// 
// StyleSystem.swift
// SwiftScape
//
// Created by Alejandro Beltrán on 1/15/25.
// 

import SwiftUI
import UIKit

// Style System constants & presets
enum StyleSystem {
  // Color  
  static let primaryColor = Color("PrimaryColor")
  static let secondaryColor = Color("SecondaryColor")
  static let accentColor = Color("AccentColor")

  // Typography
  static let primaryFont = Font.custom("Avenir", size: 16)
  static let secondaryFont = Font.custom("Avenir", size: 14)
  static let bodyFont = Font.custom("Avenir", size: 12)
  static let captionFont = Font.custom("Avenir", size: 10)

  // Spacing
  static let spacing = SpacingPreset()

  // Shadows
  static let shadow = ShadowPreset()
}

struct SpacingPreset {
  let small: CGFloat = 8
  let medium: CGFloat = 16
  let large: CGFloat = 24
  let xLarge: CGFloat = 32
}

struct ShadowPreset {
  let small = Shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
  let medium = Shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
  let large = Shadow(color: Color.black.opacity(0.1), radius: 16, x: 0, y: 8)
}

extension Color {
  init(hex: String) {
    let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
    var int: UInt64 = 0
    Scanner(string: hex).scanHexInt64(&int)
    let r, g, b: UInt64
    switch hex.count {
      case 3:
        (r, g, b) = (
          (int >> 8) * 17,
          (int >> 4 & 0xF) * 17,
          (int & 0xF) * 17
        )
      case 6:
        (r, g, b) = (
          int >> 16,
          int >> 8 & 0xFF,
          int & 0xFF
        )
      case 8: 
        (r, g, b) = (
          int >> 24,
          int >> 16 & 0xFF,
          int >> 8 & 0xFF
        )
      default: 
        (r, g, b) = (0, 0, 0)
    }
    self.init(
      .sRGB,
      red: Double(r) / 255,
      green: Double(g) / 255,
      blue: Double(b) / 255,
      opacity: 1
    )
  }
}

