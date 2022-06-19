//
//  PoemsViewModel.swift
//  Poems
//
//  Created by Dongdong Zhang on 2022/6/19.
//

import Foundation
import Combine

class PoemsViewModel: ObservableObject {
  @Published var poems: [Poem] = []
  @Published var types: [String] = []
  private var cancellable = Set<AnyCancellable>()

  init() {}

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
}
