require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "idenfy-react-native"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.authors      = package["author"]

  s.platforms    = { :ios => "15.1" }
  s.source       = { :git => "https://github.com/idenfy/ReactNativeSDK/idenfy-react-native.git", :tag => "#{s.version}" }

  s.source_files = "ios/**/*.{h,m,mm,swift}"

  s.dependency "iDenfySDK-Static/iDenfyLiveness-Static", "9.1.0"

  # RN 0.84+ moved Folly into ReactNativeDependencies prebuilds; use the
  # official helper instead of hardcoding RCT-Folly / React-Codegen pods.
  if defined?(install_modules_dependencies)
    install_modules_dependencies(s)
  else
    s.dependency "React-Core"
  end
end
