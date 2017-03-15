#
# Be sure to run `pod lib lint BCryptSwift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BCryptSwift'
  s.version          = '0.1.0'
  s.summary          = 'BCryptSwift is an implementation of bcrypt written in Swift.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
It currently is able to generate the salt and hash a phrase using a generated salt.
```
BCryptSwift.generateSaltWithNumberOfRounds(rounds: UInt) -> String
BCryptSwift.generateSalt() -> String
BCryptSwift.hashPassword(password: String, withSalt salt: String) -> String?
BCryptSwift.verifyPassword(password: String, matchesHash hash: String) -> Bool?
```

The `generateSaltWithNumberOfRounds()` class function will generate a random salt using the number of rounds provided. The number of rounds must be between 4 and 31 inclusively.

The `generateSalt()` class convenience function will generate a random salt using a default 10 rounds. This number can be adjusted based on your specific needs.

The `hashPassword(withSalt:)` class function will hash the password phrase using the salt. If there is an issue during processing, nil will be returned. Check the function documentation for details.

The `verifyPassword(matchesHash:)` class convenience function will hash the password phrase using the hash, then return the comparison between the new hash and the given hash. If there is an issue during processing, nil will be returned. Check the function documentation for details.
                       DESC

  s.homepage         = 'https://felipeflorencio.github.io'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'Apache 2.0 License', :file => 'LICENSE' }
  s.author           = { 'felipeflorencio' => 'felipeflorencio@me.com' }
  s.source           = { :git => 'https://github.com/felipeflorencio/BCryptSwift.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'BCryptSwift/Classes/**/*'
  
  # s.resource_bundles = {
  #   'BCryptSwift' => ['BCryptSwift/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
