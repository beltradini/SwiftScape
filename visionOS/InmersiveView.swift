//
//  InmersiveView.swift
//  SwiftScape
//
//  Created by Alejandro Beltrán on 1/31/25.
//

import RealityKit
import ReplayKitContent
import SwiftUI

struct InmersiveView: View {
  var body: some View {
    RealityView { content in 
      let entity = try! Entity.load(named: "3DModel.usdz")}
      content.add(entity)
  }
}