//
//  PoemBookSplitNavigationModel.swift
//  Poems
//
//  Created by Dongdong Zhang on 2022/6/20.
//

import Foundation

class PoemBookSplitNavigationModel: ObservableObject, Codable, Equatable {
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

  static func == (lhs: PoemBookSplitNavigationModel, rhs: PoemBookSplitNavigationModel) -> Bool {
    return (lhs.type == rhs.type &&
            lhs.poem == rhs.poem &&
            lhs.path == rhs.path)
  }
}
