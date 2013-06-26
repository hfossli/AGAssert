Pod::Spec.new do |s|
  s.name            = "AGAssert"
  s.version         = "0.1"
  s.summary         = "The better alternative to NSAssert"
  s.homepage        = "https://github.com/hfossli/AGAssert/new/master"
  s.authors         = { "Håvard Fossli" => "hfossli@agens.no" }
  s.license         = 'Full copyright'
  s.source          = {
    :git => "https://github.com/hfossli/AGAssert.git",
    :tag => s.version.to_s
    }
  s.source_files    = 'IVYCore/**/*.{h,m}'
  s.exclude_files   = 'IVYCoreTests/**/*Test.{h,m}'
  s.frameworks      = 'SystemConfiguration', 'IOKit', 'CoreGraphics', 'UIKit', 'QuartzCore'
  s.platform        = :ios
  s.requires_arc    = true
end
