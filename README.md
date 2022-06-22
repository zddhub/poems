# Poems

A poem app to demonstrate Navigation APIs that were introduced from WWDC22.

## Deeplink

`zddhub://poems?type=0&poemId=5&pathIds=1,2,3,4`

## Known issues

- [ ] `@SceneStorage` can't store the data
- [ ] Don't know how to subscribe to the change of `navigationModel`, No objectWillChangeSequence function is available in the video
- [ ] The `poemId` and `path` are reset after restoring from `@AppStorage`
- [ ] Update NavigationAuthority bound path tried to update multiple times per frame
- [ ] Conditional views in columns of NavigationSplitView fail to update on some state changes. (91311311)
- [ ] Selection-driven, three-column NavigationSplitView sometimes fails to push when collapsed to a single column. (93673059)

