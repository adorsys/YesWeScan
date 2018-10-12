fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew cask install fastlane`

# Available Actions
### analyze
```
fastlane analyze
```
Verfies the correctness of the podspec. This also runs tests
### publish
```
fastlane publish
```
Push the current podspec to Trunk and CSI repository
### setversion
```
fastlane setversion
```
Sets git tag to given version string (`1.2.3_build2` is possbile) and pushes to remote. E.g: fastlane ios setversion to:"0.2.6"

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
