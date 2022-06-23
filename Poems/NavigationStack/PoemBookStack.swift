//
//  PoemBookStack.swift
//  Poems
//
//  Created by Dongdong Zhang on 2022/6/19.
//

import SwiftUI

struct PoemBookStack: View {
  @StateObject private var dataModel = PoemsDataModel.shared
  @StateObject private var navigationModel = PoemBookStackNavigationModel()
  @State private var path: NavigationPath = NavigationPath()

  private var router = Router()

  var body: some View {
    NavigationStack(path: $path) {
//    NavigationStack(path: $navigationModel.path) { // Not work now
      List(dataModel.types, id: \.self) { type in
        router.route(to: type)
      }
      .navigationDestination(for: String.self) { type in
        PoemList(poems: dataModel.poemsWith(type: type))
      }
      .navigationDestination(for: Poem.self) { poem in
        PoemDetail(poem: poem)
      }
      .navigationTitle(Text("Type"))
    }
    .task {
      dataModel.load()
    }
    .onChange(of: navigationModel.path, perform: { newValue in
      navigationModel.save()
    })
    .environmentObject(dataModel)
    .environmentObject(router)
  }
}

struct PoemBookStack_Previews: PreviewProvider {
    static var previews: some View {
        PoemBookStack()
    }
}
