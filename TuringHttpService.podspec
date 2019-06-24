#
# Be sure to run `pod lib lint TuringHttpService.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TuringHttpService'
  s.version          = '0.1.0'
  s.summary          = 'A short description of TuringHttpService.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/drybochkin/Turing/'
  s.license          = { :type => 'MIT', :file => 'Http/Implementation/LICENSE' }
  s.author           = { 'drybochkin' => 'dmitry.rybochkin@gmail.com' }
  s.source           = { :git => 'https://github.com/drybochkin/Turing.git', :tag => s.version.to_s }


  s.ios.deployment_target = '9.3'

  s.source_files = 'Http/Implementation/TuringHttpService/Classes/**/*'
  
  # s.resource_bundles = {
  #   'TuringHttpService' => ['TuringHttpService/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'Alamofire'
  s.dependency 'TuringHttpServiceInterface', s.version.to_s
  s.dependency 'TuringErrorInterface', '~> 0.1.0'
  s.dependency 'TuringError', '~> 0.1.0'
end