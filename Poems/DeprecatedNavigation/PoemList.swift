//
//  PoemList.swift
//  Poems
//
//  Created by Dongdong Zhang on 2022/6/19.
//

import SwiftUI

struct PoemList: View {
  var poems: [Poem]

  init(poems: [Poem]) {
    self.poems = poems
    print("Create PoemList ...")
  }

  var body: some View {
    List(poems) { poem in
      NavigationLink(destination: PoemDetail(poem: poem)) {
        Text(poem.title)
      }
    }
    .navigationTitle(Text("Title"))
  }
}

struct PoemList_Previews: PreviewProvider {
    static var previews: some View {
        PoemList(poems: [Poem(
          id: 234,
          contents: "美人卷珠帘，深坐蹙蛾眉。\n但见泪痕湿，不知心恨谁？",
          type: "五言绝句",
          author: "李白",
          title: "怨情"
        )])
    }
}
