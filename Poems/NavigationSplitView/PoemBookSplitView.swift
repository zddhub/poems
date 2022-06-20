//
//  PoemBookSplitView.swift
//  Poems
//
//  Created by Dongdong Zhang on 2022/6/20.
//

import SwiftUI

struct PoemBookSplitView: View {
  @StateObject private var viewModel = PoemsViewModel.shared
  @StateObject private var navigationModel = PoemBookSplitNavigationModel()
  @SceneStorage("navigation") private var data: Data?

  var body: some View {
    NavigationSplitView {
      List(viewModel.types, id: \.self, selection: $navigationModel.type) { type in
        Text(type)
      }
      .navigationTitle(Text("Type"))
    } content: {
      ZStack { // Workaround: 91311311
        if let type = navigationModel.type {
          List(viewModel.poemsWith(type: type), id: \.self, selection: $navigationModel.poem) { poem in
            Text(poem.title)
          }
        }
      }
      .navigationTitle(Text("Title"))
    } detail: {
      NavigationStack(path: $navigationModel.path) {
        ZStack { // Workaround: 91311311
          if let poem = navigationModel.poem {
            PoemDetail(poem: poem)
          } else {
            EmptyView()
          }
        }
        .navigationDestination(for: Poem.self) { poem in
          PoemDetail(poem: poem)
        }
      }
    }
    .task {
      viewModel.load()

      if let data = self._data.wrappedValue {
        navigationModel.jsonData = data
      }
    }
    .onChange(of: navigationModel.type, perform: { newValue in
      self.data = navigationModel.jsonData
    })
    .onChange(of: navigationModel.poem, perform: { newValue in
      self.data = navigationModel.jsonData
    })
    .onChange(of: navigationModel.path, perform: { newValue in
      self.data = navigationModel.jsonData
    })
    .environmentObject(viewModel)
  }
}

struct PoemBookSplitView_Previews: PreviewProvider {
    static var previews: some View {
        PoemBookSplitView()
    }
}
