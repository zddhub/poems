# Poems

A poem app to demonstrate Navigation APIs that were introduced from WWDC22.

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
      Failed to decode item in navigation path at index 0. Perhaps the navigationDestination declarations
have changed since the path was encoded?
SwiftUI/NavigationPath.swift:596: Fatal error: throw through?
2022-06-23 21:26:29.584175+0800 Poems[12912:4425684] SwiftUI/NavigationPath.swift:596: Fatal error: throw through?
      ```

