Pod::Spec.new do |s|
  s.name             = "AicactusAdNetworkSDK"
  s.version          = "0.0.1"
  s.summary          = "Aicactus AdNetwork SDK"

  s.description      = <<-DESC
                        Integrate the SDK and manage your monetization with Aicactus AdNetwork SDK
                       DESC

  s.homepage         = "https://github.com/aicactus/aicactus-adnetwork-sdk-ios-lib"
  s.license          =  { :type => 'Apache-2.0', :file => 'LICENSE' }
  s.author           = { "aicactus" => "phuong@tvpsoft.com" }
  s.platform         = :ios
  s.source           = { :http => 'https://github.com/aicactus/aicactus-adnetwork-sdk-ios-lib/raw/master/AicactusAdNetworkSDK/0.0.1/AicactusAdNetworkSDK.zip'}
  s.social_media_url = 'https://twitter.com/aicactus'

  s.ios.deployment_target = '9.0'

  s.ios.frameworks = 'CoreTelephony'
  s.frameworks = 'Security', 'StoreKit', 'SystemConfiguration', 'UIKit'
  
  s.ios.vendored_frameworks = 'AicactusAdNetworkSDK.framework'
end
