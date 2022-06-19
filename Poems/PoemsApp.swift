//
//  PoemsApp.swift
//  Poems
//
//  Created by Dongdong Zhang on 2022/6/19.
//

import SwiftUI

@main
struct PoemsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
              .onAppear {
                UINavigationController().navigationBar.backItem?.title = "Back"
              }
              .environment(\.locale, .init(identifier: "zh-Hans"))
        }
    }
}
