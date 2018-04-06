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
  s.summary          = 'A short description of RxPersistenceSettings.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/3ph/RxPersistenceSettings'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '3ph' => 'instantni.med@gmail.com' }
  s.source           = { :git => 'https://github.com/3ph/RxPersistenceSettings.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

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
