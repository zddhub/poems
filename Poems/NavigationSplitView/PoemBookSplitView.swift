//
//  PoemBookSplitView.swift
//  Poems
//
//  Created by Dongdong Zhang on 2022/6/20.
//

import SwiftUI

struct PoemBookSplitView: View {
  @StateObject private var viewModel = PoemsViewModel()
  @State private var type: String?
  @State private var poem: Poem?

  var body: some View {
    NavigationSplitView {
      List(viewModel.types, id: \.self, selection: $type) { type in
        Text(type)
      }
      .navigationTitle(Text("Type"))
    } content: {
      ZStack { // Workaround: 91311311
        if let type {
          List(viewModel.poemsWith(type: type), id: \.self, selection: $poem) { poem in
            Text(poem.title)
          }
        }
      }
      .navigationTitle(Text("Title"))
    } detail: {
      NavigationStack {
        ZStack { // Workaround: 91311311
          if let poem {
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
    }
    .environmentObject(viewModel)
  }
}

struct PoemBookSplitView_Previews: PreviewProvider {
    static var previews: some View {
        PoemBookSplitView()
    }
}
