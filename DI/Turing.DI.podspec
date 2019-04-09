#
#  Be sure to run `pod spec lint Turing.DI.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "Turing.DI"
  s.version      = "0.0.1"
  s.summary      = "A very simple DI of Turing.DI."
  s.description  = <<-DESC
                    A very very long description of Turing.DI.'
                   DESC

  s.homepage     = "http://turing.ru/"
  s.license      = "MIT"
  s.author             = { "Dmitry Rybochkin" => "dmitry.rybochkin@gmail.com" }
  s.platform     = :ios, "9.3"
  s.source       = { :git => "https://github.com/DRybochkin/Turing.git", :tag => "#{s.version}" }

  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"

end
