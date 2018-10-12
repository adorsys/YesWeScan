## Release to Cocoapods

0. Ensure the validation passes

`pod lib lint`

1. Tag the release

`git tag 1.0.0`
`git push --tags`

2. Submit to Cocoapods Trunk

Before you can do this, register yourself with trunk [according to this guide][1].

`pod trunk push YesWeScan.podspec`

3. (Optional) Push to In-House Repo

`pod repo push csi-podspecs YesWeScan.podspec`

You can find more info about releasing [here][2].


[1]: https://guides.cocoapods.org/making/getting-setup-with-trunk.html#getting-started
[2]: https://guides.cocoapods.org/making/making-a-cocoapod.html
