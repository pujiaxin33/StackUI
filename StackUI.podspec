
Pod::Spec.new do |s|
  s.name         = "StackUI"
  s.version      = "0.0.2"
  s.summary      = "StackUI just like SwiftUI"
  s.homepage     = "https://github.com/pujiaxin33/StackUI"
  s.author       = { "pujiaxin33" => "317437084@qq.com" }
  s.platform     = :ios, "9.0"
  s.swift_versions = ["5.0"]
  s.source       = { :git => "https://github.com/pujiaxin33/StackUI.git", :tag => "#{s.version}" }
  s.license      = "MIT"
  s.default_subspec = 'Core'

  s.subspec 'Core' do |ss|
    ss.source_files = 'Sources/Core/*.swift'
  end

  s.subspec 'RxSwift' do |ss|
    ss.source_files = 'Sources/RxSwift/*.swift'
    ss.dependency 'StackUI/Core'
    ss.dependency 'RxSwift'
    ss.dependency 'RxCocoa'
  end

end
