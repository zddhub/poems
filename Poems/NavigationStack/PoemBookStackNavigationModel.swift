//
//  PoemBookStackNavigationModel.swift
//  Poems
//
//  Created by Dongdong Zhang on 2022/6/23.
//

import Foundation
import SwiftUI

class PoemBookStackNavigationModel: ObservableObject {
  @Published var path: NavigationPath
  @AppStorage("StackView.navigation") static private var data: Data? // @SceneStorage doesn't work here, will review it in official release

  static func readSerializedData() -> Data? {
    Self.data
  }

  static func writeSerializedData(_ data: Data) {
    Self.data = data
  }

  init() {
    if let data = Self.readSerializedData(),
       let representation = try? JSONDecoder().decode(
        NavigationPath.CodableRepresentation.self,
        from: data) {
      self.path = NavigationPath(representation)
    } else {
      self.path = NavigationPath()
    }
  }

  func save() {
    guard let representation = path.codable else { return }
    do {
      let encoder = JSONEncoder()
      let data = try encoder.encode(representation)
      Self.writeSerializedData(data)
    } catch {
        print("========Save error =====")
    }
  }
}
