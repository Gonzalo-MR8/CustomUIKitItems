#
# Be sure to run `pod lib lint CustomUIKitItems.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CustomUIKitItems'
  s.version          = '1.0.0'
  s.summary          = 'Design easier and faster with more utilities for UIKit Items'

  s.description      = "This library will allow you to modify in real time the different UIKit items with their new functionalities (gradients, rounded edges, shadows...) from the inspectors, as well as from the code itself."

  s.homepage         = 'https://github.com/Gonzalo-MR8/CustomUIKitItems'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'GonzaloMR' => 'pausekstudios@gmail.com' }
  s.source           = { :git => 'https://github.com/Gonzalo-MR8/CustomUIKitItems.git', :tag => s.version.to_s }

  s.swift_versions   = '5.8'
  s.ios.deployment_target = '13.0'

  s.source_files = 'Sources/CustomUIKitItems/**/*'

  s.ios.frameworks = ['UIKit']
end
