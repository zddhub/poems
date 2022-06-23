//
//  PoemBookSplitView.swift
//  Poems
//
//  Created by Dongdong Zhang on 2022/6/20.
//

import SwiftUI

struct PoemBookSplitView: View {
  @StateObject private var dataModel = PoemsDataModel.shared
  @StateObject private var navigationModel = PoemBookSplitNavigationModel()
  @AppStorage("SplitView.navigation") private var data: Data? // @SceneStorage doesn't work here, will review it in official release

  var body: some View {
    NavigationSplitView {
      List(dataModel.types, id: \.self, selection: $navigationModel.type) { type in
        Text(type)
      }
      .navigationTitle(Text("Type"))
    } content: {
      ZStack { // Workaround: 91311311
        if let type = navigationModel.type {
          List(dataModel.poemsWith(type: type), id: \.self, selection: $navigationModel.poem) { poem in
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
      dataModel.load()

// Can't work currently, use workaround way instead of objectWillChangeSequence
//      if let data {
//        navigationModel.jsonData = data
//      }
//
//      for await _ in navigationModel.objectWillChangeSequence { // objectWillChangeSequence 在 beta 版本中不可用
//        data = navigationModel.jsonData
//      }
    }
    // Workaround
    .onChange(of: navigationModel.type, perform: { newValue in
      self.data = _navigationModel.wrappedValue.jsonData
    })
    .onChange(of: navigationModel.poem, perform: { newValue in
      self.data = _navigationModel.wrappedValue.jsonData
    })
    .onChange(of: navigationModel.path, perform: { newValue in
      self.data = _navigationModel.wrappedValue.jsonData
    })
    .onChange(of: dataModel.poems, perform: { newValue in
      if let data = self.data {
        navigationModel.jsonData = data
      }
    })
    .environmentObject(dataModel)
    .onOpenURL { url in
      navigationModel.redirect(to: url.absoluteString)
    }
  }
}

struct PoemBookSplitView_Previews: PreviewProvider {
    static var previews: some View {
        PoemBookSplitView()
    }
}
