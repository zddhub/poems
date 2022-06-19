//
//  DeprecatedPoemBook.swift
//  Poems
//
//  Created by Dongdong Zhang on 2022/6/19.
//

import SwiftUI

struct DeprecatedPoemBook: View {
  @StateObject private var viewModel = PoemsViewModel()

  var body: some View {
    NavigationView {
      List(viewModel.types, id: \.self) { type in
        NavigationLink(type, destination: DeprecatedPoemList(poems: viewModel.poemsWith(type: type)))
      }
      .navigationTitle(Text("Type"))
    }
    .task {
      viewModel.load()
    }
    .environmentObject(viewModel)
  }
}

struct DeprecatedPoemBook_Previews: PreviewProvider {
    static var previews: some View {
        DeprecatedPoemBook()
    }
}
