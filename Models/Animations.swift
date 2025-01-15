// 
// Animations.swift
// SwiftScape
//
// Created by Alejandro Beltrán on 1/13/25.
//

import SwiftUI

struct Animation {
  enum AnimationType {
    case fade
    case scale 
    case slide
    case rotate
    case bounce

    var duration: Double {
      switch self {
        case .fade: return 0.3
        case .scale: return 0.5
        case .slide: return 0.3
        case .rotate: return 0.5
        case .bounce: return 0.5
      }
    }
  }

  var type: AnimationType
  var delay: Double
  var repeatCount: Int
}