//
//  RelatedPoems.swift
//  Poems
//
//  Created by Dongdong Zhang on 2022/6/19.
//

import SwiftUI

struct DeprecatedRelatedPoems: View {
  var poem: Poem
  @EnvironmentObject private var viewModel: PoemsViewModel

  var body: some View {
    if relatedPoems.count > 0 {
      VStack(alignment: .leading, spacing: 6.0) {
        Divider()
        Text("See \(poem.author) more poetries:")
          .font(.footnote)
        ForEach(relatedPoems) { poem in
          HStack {
            NavigationLink(destination: DeprecatedPoemDetail(poem: poem)) {
              Text(poem.title)
                .font(.body)
            }
            Spacer()
          }
        }
      }
      .padding()
    } else {
      EmptyView()
    }
  }

  private var relatedPoems: [Poem] {
    viewModel.relatedPoems(poem: poem)
  }
}

struct DeprecatedRelatedPoemsRelatedPoems_Previews: PreviewProvider {
    static var previews: some View {
      DeprecatedPoemDetail(poem: Poem(
        id: 234,
        contents: "美人卷珠帘，深坐蹙蛾眉。\n但见泪痕湿，不知心恨谁？",
        type: "五言绝句",
        author: "李白",
        title: "怨情"
      ))
    }
}
