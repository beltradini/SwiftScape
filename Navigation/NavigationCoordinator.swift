// 
// NavigationCoordinator.swift
// SwiftScape 
//
// Created by Alejandro Beltrán on 1/15/25
// 

import SwiftUI
import UIKit 

class NavigationCoordinator: ObservableObject {
  @Published var path = NavigationPath()
  @Published var selectedComponent: any UIComponent? 
  @Published var activeView: ActiveView = .canvas 

  enum ActiveView {
    case canvas 
    case components
    case preview
    case settings
  }
}