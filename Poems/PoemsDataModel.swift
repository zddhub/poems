//
//  PoemsDataModel.swift
//  Poems
//
//  Created by Dongdong Zhang on 2022/6/19.
//

import Foundation
import Combine

class PoemsDataModel: ObservableObject {
  @Published var poems: [Poem] = []
  @Published var types: [String] = []
  private var cancellable = Set<AnyCancellable>()

  public static let shared = PoemsDataModel()

  private init() {}

  subscript(id: Int?) -> Poem? {
    guard let id, id > 0 && id < poems.count else {
      return nil
    }
    return poems[id-1]
  }

  func load() {
    guard let url = Bundle.main.url(forResource: "poems-300", withExtension: "json") else {
      return
    }

    URLSession.shared
      .dataTaskPublisher(for: url)
      .tryMap { $0.data }
      .decode(type: [Poem].self, decoder: JSONDecoder())
      .replaceError(with: [])
      .receive(on: DispatchQueue.main)
      .sink { poems in
        self.poems = poems
        self.types = Array(Set(poems.map(\.type))).sorted()
      }
      .store(in: &cancellable)
  }

  func poemsWith(type: String) -> [Poem] {
    poems.filter { $0.type == type }
  }

  func relatedPoems(poem: Poem?) -> [Poem] {
    guard let poem else { return [] }

    return poems.filter {
      $0.author == poem.author && $0.type == poem.type && $0.title != poem.title
    }
  }
}
