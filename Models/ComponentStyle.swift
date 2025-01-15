// 
// ComponentStyle.swift
// SwiftScape
//
// Created by Alejandro Beltrán on 1/15/25.
//

import SwiftUI
import UIKit  

struct ComponentStyle {
  var font: Font = StyleSystem.primaryFont
  var textColor: Color = StyleSystem.primaryColor
  var backgroundColor: Color = StyleSystem.secondaryColor
  var cornerRadius: CGFloat = 8
  var shadow: Shadow = StyleSystem.shadow.small
  var padding: EdgeInsets = EdgeInsets(
    top: StyleSystem.spacing.small,
    leading: StyleSystem.spacing.medium,
    bottom: StyleSystem.spacing.small,
    trailing: StyleSystem.spacing.medium
  )

  static let button = ComponentStyle(
    font: StyleSystem.primaryFont,
    textColor: StyleSystem.primaryColor,
    backgroundColor: StyleSystem.accentColor,
    cornerRadius: 8,
    shadow: StyleSystem.shadow.small,
    padding: EdgeInsets(
      top: StyleSystem.spacing.small,
      leading: StyleSystem.spacing.medium,
      bottom: StyleSystem.spacing.small,
      trailing: StyleSystem.spacing.medium
    )
  )

  static let card = ComponentStyle(
    font: StyleSystem.secondaryFont,
    textColor: StyleSystem.primaryColor,
    backgroundColor: StyleSystem.secondaryColor,
    cornerRadius: 16,
    shadow: StyleSystem.shadow.medium,
    padding: EdgeInsets(
      top: StyleSystem.spacing.medium,
      leading: StyleSystem.spacing.medium,
      bottom: StyleSystem.spacing.medium,
      trailing: StyleSystem.spacing.medium
    )
  )

}