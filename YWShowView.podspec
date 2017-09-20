
Pod::Spec.new do |s|

  s.name         = "YWShowView"
  s.version      = "0.0.1"
  s.summary      = "a simple demo for show base subview"
  s.description  = <<-DESC 
                      push subview from bottom
                   DESC

  s.homepage     = "https://github.com/YWSawyer/YWShowView"

  s.license      = "MIT"

  s.author             = { "YWSawyer" => "yuan_wei_1@163.com" }
  # s.authors            = { "YWSawyer" => "yuan_wei_1@163.com" }
  # s.social_media_url   = "http://twitter.com/YWSawyer"

  s.platform     = :ios, "8.0"
  s.ios.deployment_target = "8.0"

  s.source       = { :git => "https://github.com/YWSawyer/YWShowView.git", :tag => "0.0.1" }

  s.source_files  = "YWShowView", "*.{h,m}"

  # s.exclude_files = "Classes/Exclude"
  # s.public_header_files = "Classes/**/*.h"
  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"
  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # s.framework  = "SomeFramework"
  s.frameworks = 'Foundation', 'UIKit'

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
