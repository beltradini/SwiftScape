// 
// AppRoute.swift
//
// Created by Alejandro Beltrán on 1/31/25.
//

import Foundation

enum AppRoute: Hashable {
  case home 
  case detail(id: UUID)
}