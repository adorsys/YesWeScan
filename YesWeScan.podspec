#
# Be sure to run `pod lib lint DocumentScanner.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YesWeScan'
  s.version          = '1.0.3'
  s.summary          = 'adorsys Document Scanner (incl. View Controller)'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This pod contains a ready to use view controller for document scanning.
                       DESC

  s.homepage         = 'https://github.com/adorsys/document-scanner-ios.git'
  s.license          = { :type => 'Apache License 2.0', :file => 'LICENSE' }
  s.author           = { 'xaverlohmueller' => 'xlo@adorsys.de', 'steffen blümm' => 'sbl@adorsys.de' }
  s.source           = { :git => 'https://github.com/adorsys/document-scanner-ios.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.swift_version = '4.2'

  s.source_files = 'Sources/Classes/**/*'
  s.resources = 'Sources/Assets/**/*'
  s.frameworks = 'AVFoundation'

  s.test_spec 'Tests' do |test_spec|
    test_spec.source_files = 'Tests/*.swift'
  end
end
