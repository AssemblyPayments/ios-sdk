Pod::Spec.new do |s|
  s.name             = "PromisePay"
  s.version          = "0.1.0"
  s.summary          = "PromisePay iOS SDK"
  s.description      = <<-DESC
                        The implementation of PromisePay Client SDK
                        DESC
  s.homepage         = "https://github.com/PromisePay/ios-sdk"
  s.license          = 'MIT'
  s.author           = { "KevinHakans" => "kevin.hakans.it@gmail.com" }
  s.source           = { :git => "https://github.com/PromisePay/ios-sdk.git", :tag => "v0.1.0" }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'PromisePay' => ['Pod/Assets/*.png']
  }

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'Foundation'

  s.dependency 'CardIO', '~> 5.3'
end
