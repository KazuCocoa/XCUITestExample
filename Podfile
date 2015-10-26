# Uncomment this line to define a global platform for your project
# platform :ios, '6.0'

platform :ios, '7.0'

post_install do |installer|
    `find Pods -regex 'Pods\\/Quick\\/Quick\\/Quick\\.h' -print0 | xargs -0 sed -i '' 's/\\(<\\)Quick\\/\\(.*\\)\\(>\\)/\\"\\2\\"/'`
end

def quick
  use_frameworks!
  pod 'Quick', :git => 'https://github.com/Quick/Quick.git', :branch => 'xcode7.1'
  pod 'Nimble', :git => 'https://github.com/Quick/Nimble.git', :branch => 'xcode7.1'
  # pod 'Quick', '~> 0.6.0'
  # pod 'Nimble', '2.0.0-rc.3'
end

target 'TestApp' do

end

target 'TestAppUITests' do
  quick
end

