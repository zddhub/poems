//
//  Router.swift
//  Poems
//
//  Created by Dongdong Zhang on 2022/6/23.
//

import Foundation
import SwiftUI

class Router: ObservableObject {
  @ViewBuilder
  func route(to poem: Poem) -> some View {
    NavigationLink(value: poem) {
      Text(poem.title)
    }
  }

  @ViewBuilder
  func route(to type : String) -> some View {
    NavigationLink(value: type) {
      Text(type)
    }
  }
}
