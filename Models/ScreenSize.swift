// 
// ScreenSize.swift
// SwiftScape
// 
// Created by Alejandro Beltrán on 1/14/25
// 

import Foundation
import SwiftUI
import UIKit

enum ScreenSize {
    case small // iPhone SE
    case medium // iPhone Regular
    case large // iPhone Pro Max
    case xlarge // iPad

    static func current() -> ScreenSize {
      let width = UIScreen.main.bounds.size.width
      switch width {
        case ..<375: return .small
        case 375..<414: return .medium
        case 414..<768: return .large
        default: return .xlarge
        } 
    }
}
