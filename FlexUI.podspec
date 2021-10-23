Pod::Spec.new do |spec|
  spec.name = 'FlexUI'
  spec.version = '0.5'
  spec.license =  { :type => 'MIT' }
  spec.homepage = 'https://github.com/WillPromise/FlexUI'

  spec.summary = 'FlexUI is a layout DSL'
  spec.description = 'FlexUI is a DSL like SwiftUI'
  spec.authors = 'FlexUI Authors'
  spec.source = {
    :git => 'https://github.com/WillPromise/FlexUI.git',
    :tag => spec.version.to_s,
  }
  spec.source_files = 'Sources/**/*.swift'
  spec.platforms = { :ios => "9.0" }
  spec.dependency 'Yoga'
  spec.dependency 'YogaKit'
  spec.dependency 'RxSwift'
end
