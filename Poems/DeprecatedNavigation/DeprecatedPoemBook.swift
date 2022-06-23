//
//  DeprecatedPoemBook.swift
//  Poems
//
//  Created by Dongdong Zhang on 2022/6/19.
//

import SwiftUI

struct DeprecatedPoemBook: View {
  @StateObject private var dataModel = PoemsDataModel.shared

  var body: some View {
    NavigationView {
      List(dataModel.types, id: \.self) { type in
        NavigationLink(type, destination: DeprecatedPoemList(poems: dataModel.poemsWith(type: type)))
      }
      .navigationTitle(Text("Type"))
    }
    .task {
      dataModel.load()
    }
    .environmentObject(dataModel)
  }
}

struct DeprecatedPoemBook_Previews: PreviewProvider {
    static var previews: some View {
        DeprecatedPoemBook()
    }
}
