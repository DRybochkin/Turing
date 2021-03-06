#
# Be sure to run `pod lib lint TuringHttpService.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TuringHttpService'
  s.version          = '0.1.1'
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
  s.license          = { :type => 'MIT', :file => 'Sources/Http/Implementation/LICENSE' }
  s.author           = { 'drybochkin' => 'dmitry.rybochkin@gmail.com' }
  s.source           = { :git => 'https://github.com/drybochkin/Turing.git', :tag => s.version.to_s }


  s.ios.deployment_target = '9.3'

  s.source_files = 'Sources/Http/Implementation/TuringHttpService/Classes/**/*'
  
  s.dependency 'Alamofire'
  s.dependency 'TuringHttpServiceInterface', s.version.to_s
  s.dependency 'TuringErrorInterface', '~> 0.1.0'
  s.dependency 'TuringError', '~> 0.1.0'
end
