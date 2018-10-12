## Release to Cocoapods

0. Ensure the validation passes

`bundle exec fastlane analyze`

This will run `pod lib lint` internally.

1. Tag the release

`bundle exec fastlane setversion to:x.y.z`

2. Submit to Cocoapods Trunk

Before you can do this, register yourself with trunk [according to this guide][1].

`bundle exec fastlane publish`

You can find more info about releasing [here][2].


[1]: https://guides.cocoapods.org/making/getting-setup-with-trunk.html#getting-started
[2]: https://guides.cocoapods.org/making/making-a-cocoapod.html
