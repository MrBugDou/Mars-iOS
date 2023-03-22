# encoding:utf-8
#
# Be sure to run `pod lib lint WeChatQRCodeScanner_Swift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name = "Mars-iOS"
  s.version = "0.0.1"
  s.summary = "Cocoapods for tencent mars"
  s.description = <<-DESC
                      腾讯Mars pod版本,swift、oc皆可使用
                      DESC

  s.homepage = "https://github.com/MrBugDou/Mars"

  s.license = { :type => "MIT", :file => "LICENSE" }

  s.author = { "MrBugDou" => "bg1859710@gmail.com" }

  s.source = { :git => "https://github.com/MrBugDou/Mars.git", :tag => s.version.to_s }

  s.requires_arc = true

  s.static_framework = true

  s.default_subspec = "Core"

  s.ios.deployment_target = "9.0"

  s.ios.libraries = "z", "c++", "resolv.9"

  s.ios.frameworks = "Foundation", "CoreLocation", "CoreTelephony", "SystemConfiguration"

  # s.prefix_header_file = false
  s.pod_target_xcconfig = {
    "CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES" => "YES",
    "OTHER_CPLUSPLUSFLAGS" => "-fmodules -fcxx-modules",
    "EXCLUDED_ARCHS[sdk=iphonesimulator*]" => "arm64",
    "CLANG_WARN_DOCUMENTATION_COMMENTS" => "NO",
    "BUILD_LIBRARY_FOR_DISTRIBUTION" => "YES",
    "VALID_ARCHS" => "arm64",
    "OTHER_LDFLAGS" => [
      "-w",
      "-lc++",
      "-lObjC",
      "-all_load",
    ],
  }

  s.user_target_xcconfig = {
    "CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES" => "YES",
    "OTHER_CPLUSPLUSFLAGS" => "-fmodules -fcxx-modules",
    "EXCLUDED_ARCHS[sdk=iphonesimulator*]" => "arm64",
    "OTHER_LDFLAGS" => [
      "-w",
      "-lc++",
      "-lObjC",
      "-all_load",
    ],
  }

  s.preserve_paths = [
    "Mars/Frameworks",
    # "script/build.sh",
    "script/downloadlib.sh",
  ]

  # s.prepare_command = <<-CMD
  #   script/build.sh "master"
  # CMD

  # s.prepare_command = <<-CMD
  #   script/downloadlib.sh "lib-v1"
  # CMD

  s.subspec "Core" do |core|
    core.source_files = [
      "Mars/Frameworks/*.{h,cc}",
      "Mars/Classes/**/*.{h,cc,m,mm}",
    ]

    core.public_header_files = [
      "Mars/Classes/**/*.h",
    ]

    core.private_header_files = [
      "Mars/Frameworks/*.h",
    ]

    core.vendored_frameworks = [
      "Mars/Frameworks/mars.framework",
    ]
  end

  s.subspec "Xlog" do |ss|
    ss.source_files = [
      "Mars/Classes/Xlog/**/*.{h,cc,m,mm}",
    ]

    ss.public_header_files = [
      "Mars/Classes/Xlog/*.h",
    ]

    ss.private_header_files = [
      "Mars/Classes/Xlog/PublicComponentV2/*.h",
    ]

    ss.vendored_frameworks = [
      "Mars/Frameworks/xlog/mars.framework",
    ]
  end
end
