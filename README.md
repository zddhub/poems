# Poems

A poem app to demonstrate Navigation APIs that were introduced from [WWDC22 10054](https://developer.apple.com/videos/play/wwdc2022/10054).

Read [【WWDC22 10054】SwiftUI 新导航方案](https://xiaozhuanlan.com/topic/7841259603) to know more about this App.

![Screenshot](./assets/poems-app-screenshot.png)

## Navigation Stack

<!-- ![![Stack](./assets/navigation-stack-diagram.gif)](./assets/poems-navigation-stack.mp4) -->

<div align="centor">
      <a href="./assets/poems-navigation-stack.mp4">
         <img src="./assets/navigation-stack-diagram.gif" style="width:100%;">
      </a>
</div>

## Deeplink

`zddhub://poems?type=0&poemId=5&pathIds=1,2,3,4`

## Known issues

- [ ] `@SceneStorage` can't store the data
- [ ] Don't know how to subscribe to the change of `navigationModel`, No objectWillChangeSequence function is available in the video
- [ ] The `poemId` and `path` are reset after restoring from `@AppStorage`
- [ ] Update NavigationAuthority bound path tried to update multiple times per frame
- [ ] The i18n of back button doesn't work
- [ ] Conditional views in columns of NavigationSplitView fail to update on some state changes. (91311311)
- [ ] Selection-driven, three-column NavigationSplitView sometimes fails to push when collapsed to a single column. (93673059)
- [ ] NavigationPath store and restore error: NavigationPath.swift:596: Fatal error: throw through?

      ```
      Failed to decode item in navigation path at index 0. Perhaps the navigationDestination declarations have changed since the path was encoded?
      SwiftUI/NavigationPath.swift:596: Fatal error: throw through? 2022-06-23 21:26:29.584175+0800 Poems[12912:4425684] SwiftUI/NavigationPath.swift:596: Fatal error: throw through?
      ```
- [ ] Still need to wait for macOS 13.0 to build macOS App

