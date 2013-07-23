#
# Be sure to run `pod spec lint AGAssert.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about the attributes see http://docs.cocoapods.org/specification.html
#
Pod::Spec.new do |s|
  s.name         = "AGAssert"
  s.version      = "0.1"
  s.summary      = "Similar to NSAssert, but with slightly improved logging and is meant to ship with apps in release."
  s.homepage     = "https://github.com/hfossli/AGAssert"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Håvard Fossli" => "hfossli@gmail.com" }
  s.source       = { 
    :git => "https://github.com/hfossli/AGAssert.git", 
    :tag => s.version.to_s
    }
  s.source_files = 'Source'
  # s.exclude_files = 'Source/Exclude'
  s.requires_arc = true
end
