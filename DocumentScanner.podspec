#
# Be sure to run `pod lib lint DocumentScanner.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DocumentScanner'
  s.version          = '1.0.0'
  s.summary          = 'adorsys Document Scanner (incl. View Controller)'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This pod contains a ready to use view controller for document scanning.
                       DESC

  s.homepage         = 'https://github.com/adorsys/document-scanner-ios'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'Apache License 2.0', :file => 'LICENSE' }
  s.author           = { 'xaverlohmueller' => 'xlo@adorsys.de', 'steffen blümm' => 'sbl@adorsys.de' }
  s.source           = { :git => 'https://github.com/adorsys/document-scanner-ios', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }

  s.source_files = 'DocumentScanner/Classes/**/*'
  s.resource_bundles = {
    'Assets' => ['DocumentScanner/Assets/**/*']
  }
  s.frameworks = 'AVFoundation'
end
