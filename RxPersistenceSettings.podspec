#
# Be sure to run `pod lib lint RxPersistenceSettings.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RxPersistenceSettings'
  s.version          = '0.0.1'
  s.summary          = '.'
  s.description      = <<-DESC
  Set of generic protocols for persisted settings with metadata, observable changes, etc. Currently implemented for UserDefaults.
                       DESC

  s.homepage         = 'https://github.com/3ph/RxPersistenceSettings'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Tomas Friml' => 'instantni.med@gmail.com' }
  s.source           = { :git => 'https://github.com/3ph/RxPersistenceSettings.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'

  s.source_files = 'RxPersistenceSettings/Classes/**/*'
  
  s.dependency 'RxCocoa', '~> 4.1.2'
  
  s.subspec 'Core' do |sp|
      sp.source_files = 'Classes/Core'
  end
  
  s.subspec 'UserDefaults' do |sp|
      sp.dependency 'RxPersistenceSettings/Core'
      sp.source_files = 'Classes/UserDefaults'
  end
end
