//
//  Poem.swift
//  Poems
//
//  Created by Dongdong Zhang on 2022/6/19.
//

import Foundation

struct Poem: Codable, Hashable, Identifiable {
  let id: Int
  let contents: String
  let type: String
  let author: String
  let title: String
}
