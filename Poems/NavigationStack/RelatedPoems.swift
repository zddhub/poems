//
//  RelatedPoems.swift
//  Poems
//
//  Created by Dongdong Zhang on 2022/6/19.
//

import SwiftUI

struct RelatedPoems: View {
  var poem: Poem
  @EnvironmentObject private var dataModel: PoemsDataModel

  var body: some View {
    if relatedPoems.count > 0 {
      VStack(alignment: .leading, spacing: 6.0) {
        Divider()
        Text("See \(poem.author) more poetries:")
          .font(.footnote)
        ForEach(relatedPoems) { poem in
          HStack {
            NavigationLink(value: poem) {
              Text(poem.title)
                .font(.body)
            }
            Spacer()
          }
        }
      }
    } else {
      EmptyView()
    }
  }

  private var relatedPoems: [Poem] {
    dataModel.relatedPoems(poem: poem)
  }
}

struct RelatedPoems_Previews: PreviewProvider {
    static var previews: some View {
      PoemDetail(poem: Poem(
        id: 234,
        contents: "美人卷珠帘，深坐蹙蛾眉。\n但见泪痕湿，不知心恨谁？",
        type: "五言绝句",
        author: "李白",
        title: "怨情"
      ))
      .environmentObject(PoemsDataModel.shared)
    }
}
