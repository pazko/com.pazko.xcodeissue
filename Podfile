# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

# Comment the next line if you don't want to use dynamic frameworks
platform :ios, '15.0'
#ENV['SWIFT_VERSION'] = '5'
use_frameworks!
def shared_pods
  pod 'TwitterKit'
end

target 'xcode_issue' do
  shared_pods

  # Pods for xcode_issue

  target 'xcode_issueTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'xcode_issueUITests' do
    # Pods for testing
  end

end

post_install do |pi|
  # xcode 16 build
  bitcode_strip_path = `xcrun --find bitcode_strip`.chop!
  
  def strip_bitcode_from_framework(bitcode_strip_path, framework_relative_path)
    framework_path = File.join(Dir.pwd, framework_relative_path)
    command = "#{bitcode_strip_path} #{framework_path} -r -o #{framework_path}"
    puts "Stripping bitcode: #{command}"
    system(command)
  end

  framework_paths = [
  "Pods/TwitterCore/iOS/TwitterCore.framework/TwitterCore",
  "Pods/TwitterKit/iOS/TwitterKit.framework/TwitterKit",
  ]

  framework_paths.each do |framework_relative_path|
    strip_bitcode_from_framework(bitcode_strip_path, framework_relative_path)
  end

end
