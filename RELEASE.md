## Release to Cocoapods

### 0. Ensure the validation passes

`bundle exec fastlane analyze`

This will run `pod lib lint` internally.

## 1. Tag the release

`bundle exec fastlane setversion to:x.y.z`

This will create a commit with `Version bump to x.y.z` and set a tag with `x.y.z`.

## 2. Update the Changelog

Describe all new features and bugfixes in `CHANGELOG.md`.

## 3. Update Example App

Run `pod install` in the Example app folder. 

Add the changes to the version bump commit.
This can be done with `git commit --amend`. 

## 4. Push to origin

Push the tag and the commit to origin.

## 5. Submit to Cocoapods Trunk

Before you can do this, register yourself with trunk [according to this guide][1].

`bundle exec fastlane publish`

You can find more info about releasing [here][2].

## 6. Draft a new GitHub Release

Follow the instructions [here][3] to draft a release using the Changelog and the tag.


[1]: https://guides.cocoapods.org/making/getting-setup-with-trunk.html#getting-started
[2]: https://guides.cocoapods.org/making/making-a-cocoapod.html
[3]: https://github.com/adorsys/YesWeScan/releases
