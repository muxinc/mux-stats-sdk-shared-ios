Pod::Spec.new do |s|
  s.name             = 'MUXStatsSDKShared'

  s.version          = '0.1.0'
  s.source           = { :git => 'https://github.com/muxinc/mux-stats-sdk-shared-ios.git', :tag => s.version.to_s }

  s.summary          = 'The Mux Stats shared components SDK'
  s.description      = 'The Mux Stats SDK that contains important shared models and utilities that are used withing the iOS player SDKs'

  s.homepage         = 'https://mux.com'
  s.social_media_url = 'https://twitter.com/muxhq'

  s.license          = 'Apache 2.0'
  s.author           = { 'Mux' => 'ios-sdk@mux.com' }

  s.ios.deployment_target = '9.0'
  s.tvos.deployment_target = '9.0'

  s.dependency 'Mux-Stats-Core', '~>3.11'

  s.source_files = 'MUXStatsSDKShared/Sources/**/*'
end
