//
//  PoemBookStack.swift
//  Poems
//
//  Created by Dongdong Zhang on 2022/6/19.
//

import SwiftUI

struct PoemBookStack: View {
  @StateObject private var dataModel = PoemsDataModel.shared
  private var router = Router()

  var body: some View {
    NavigationStack {
      List(dataModel.types, id: \.self) { type in
        router.route(to: type)
      }
      .navigationDestination(for: String.self, destination: { type in
        PoemList(poems: dataModel.poemsWith(type: type))
      })
      .navigationDestination(for: Poem.self) { poem in
        PoemDetail(poem: poem)
      }
      .navigationTitle(Text("Type"))
    }
    .task {
      dataModel.load()
    }
    .environmentObject(dataModel)
    .environmentObject(router)
  }
}

struct PoemBookStack_Previews: PreviewProvider {
    static var previews: some View {
        PoemBookStack()
    }
}
