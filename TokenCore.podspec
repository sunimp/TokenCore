#
# Be sure to run `pod lib lint TokenCore.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TokenCore'
  s.version          = '0.1.0'
  s.summary          = 'Blockchain Library for Webull.'
  s.description      = <<-DESC
  Token Core Library powering Wallet.
                       DESC
  s.author        = { "Yang Guang" => "holaux@gmail.com" }
  s.homepage      = "https://token.im"
  s.license       = {
    type: "Apache License, Version 2.0",
    file: "LICENSE"
  }
  s.author           = { 'Yang Guang' => 'holaux@gmail.com' }
  s.source           = { :git => 'https://github.com/sunimp/TokenCore.git', :tag => s.version.to_s }
  s.ios.deployment_target = '12.0'
  s.source_files = 'TokenCore/**/*.{h,m,swift}'
  s.swift_version = "5.0"
  s.dependency "CryptoSwift", '1.2.0'
  s.dependency "BigInt"
  s.dependency "GRKOpenSSLFramework"
  s.dependency "CoreBitcoin"
  s.dependency "libscrypt"
  s.dependency "secp256k1.swift"
  s.xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }

end
