//
//  ContentView.swift
//  Poems
//
//  Created by Dongdong Zhang on 2022/6/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
          TabView {
            PoemBookSplitView()
              .tabItem {
                Label("NavigationSplitView", systemImage: "rectangle.split.3x1")
              }
            PoemBookStack()
              .tabItem {
                Label("NavigationStack", systemImage: "square.stack.3d.up")
              }
            DeprecatedPoemBook()
              .tabItem {
                Label("NavigationView", systemImage: "xmark.rectangle")
              }
          }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
