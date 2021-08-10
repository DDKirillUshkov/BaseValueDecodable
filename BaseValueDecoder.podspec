#
# Be sure to run `pod lib lint AlamofireSessionRenewer.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BaseValueDecoder'
  s.version          = '1.0.0'
  s.summary          = 'Serialize diferent types to any simple types (Bool, Int, String ...)'

  s.homepage         = 'https://dashdevs.com'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'dashdevs llc' => 'hello@dashdevs.com' }
  s.source           = { :git => 'https://github.com/dashdevs/BaseValueDecodable.git', :tag => s.version.to_s }

  s.source_files = 'Sources/BaseValueDecoder/**/*'
  
  s.ios.deployment_target = '10.0'
  s.osx.deployment_target = '10.12'
  s.tvos.deployment_target = '10.0'
  s.watchos.deployment_target = '3.0'
  
  s.swift_versions = ['5.0', '5.1']
end
