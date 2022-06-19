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
//          DeprecatedPoemBook()
          PoemBookStack()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
