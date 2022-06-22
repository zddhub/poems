//
//  PoemBookSplitNavigationModel.swift
//  Poems
//
//  Created by Dongdong Zhang on 2022/6/20.
//

import Foundation

class PoemBookSplitNavigationModel: ObservableObject, Codable {
  @Published var type: String?
  @Published var poem: Poem?
  @Published var path: [Poem] = []

  enum CodingKeys: String, CodingKey {
    case type
    case poemId
    case pathIds
  }

  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(type, forKey: .type)
    try container.encodeIfPresent(poem?.id, forKey: .poemId)
    try container.encode(path.map(\.id), forKey: .pathIds)
  }

  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.type = try container.decodeIfPresent(String.self, forKey: .type)

    let poemId = try container.decodeIfPresent(Int.self, forKey: .poemId)
    self.poem = PoemsViewModel.shared[poemId]

    let pathIds = try container.decode([Poem.ID].self, forKey: .pathIds)
    self.path = pathIds.compactMap({ PoemsViewModel.shared[$0] })
  }

  required init() {}

  var jsonData: Data? {
    get {
      return try? JSONEncoder().encode(self)
    }

    set {
      guard let newValue else { return }
      let newModel = try? JSONDecoder().decode(PoemBookSplitNavigationModel.self, from: newValue)
      self.type = newModel?.type
      self.poem = newModel?.poem
      self.path = newModel?.path ?? []
    }
  }

  func redirect(to: String) {
    // Test deeplink sample:
    //  xcrun simctl openurl booted "zddhub://poems?type=0&poemId=5&pathIds=1,2,3,4"
    let regex = /zddhub:\/\/poems\?type=(\d+)&poemId=(\d+)&pathIds=(.*)/

    guard let match = to.firstMatch(of: regex) else { return }
    let (_, typeMatched, poemIdMatched, pathIdsMatched) = match.output
    guard let type = Int(typeMatched),
          let poemId = Int(poemIdMatched) else { return }

    self.type = PoemsViewModel.shared.types[type]
    self.poem = PoemsViewModel.shared[poemId]
    self.path = pathIdsMatched.split(by: ",").compactMap { PoemsViewModel.shared[Int($0)] }
  }
}
