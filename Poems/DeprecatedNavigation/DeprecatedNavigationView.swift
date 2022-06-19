//
//  DeprecatedNavigationView.swift
//  Poems
//
//  Created by Dongdong Zhang on 2022/6/19.
//

import SwiftUI

struct DeprecatedNavigationView: View {
  @StateObject private var viewModel = PoemsViewModel()

  var body: some View {
    NavigationView {
      List(viewModel.types, id: \.self) { type in
        NavigationLink(type, destination: PoemList(poems: viewModel.poemsWith(type: type)))
      }
      .navigationTitle(Text("Type"))
    }
    .task {
      viewModel.load()
    }
  }
}

struct DeprecatedNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        DeprecatedNavigationView()
    }
}
