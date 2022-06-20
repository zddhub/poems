//
//  PoemDetail.swift
//  Poems
//
//  Created by Dongdong Zhang on 2022/6/19.
//

import SwiftUI

struct PoemDetail: View {
  var poem: Poem

  init(poem: Poem) {
    self.poem = poem
    print("Create PoemDetail ...")
  }

  var body: some View {
    ScrollView {
      poemContent
      RelatedPoems(poem: poem)
    }
    .padding(.horizontal)
  }

  var poemContent: some View {
    VStack(spacing: 16) {
      Text(poem.title)
        .font(.title)
      Text(poem.author)
      Text("\(poem.contents)")
        .lineSpacing(8.0)
    }
  }
}

struct PoemDetail_Previews: PreviewProvider {
    static var previews: some View {
      PoemDetail(poem: Poem(
        id: 234,
        contents: "美人卷珠帘，深坐蹙蛾眉。\n但见泪痕湿，不知心恨谁？",
        type: "五言绝句",
        author: "李白",
        title: "怨情"
      ))
      .environmentObject(PoemsViewModel.shared)
    }
}
