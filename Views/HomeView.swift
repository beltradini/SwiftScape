//
//  HomeView.swift
//  SwiftScape
//
//  Created by Alejandro Beltrán on 1/31/25.
//

import SwiftUI

struct HomeView: View {
  @Binding var path: [AppRoute]

  var body: some View {
    VStack {
      Text("Welcome to SwiftScape")

      Button("Go to Detail") {
        path.append(.detail(id: UUID()))
      }
    }
    .NavigationDestination(for: AppRoute.self) { route in 
      switch route {
        case .home: 
          HomeView(path: $path)
        case .detail(let id):
          DetailView(id: id)
      }
    }
  }
}