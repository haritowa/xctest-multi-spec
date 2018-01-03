Pod::Spec.new do |s|
  s.name = 'XCTestMultiSpec'
  s.version = '1.0.0'
  s.license = 'MIT'
  s.summary = 'Performance multi spec'
  s.homepage = 'https://github.com/haritowa/xctest-multi-spec'
  s.authors = { 'Anton Kharchenko' => 'haritowa@icloud.com' }
  s.source = { :git => 'https://github.com/haritowa/xctest-multi-spec.git', :tag => s.version }

  s.ios.deployment_target = '8.0'

  s.public_header_files = [
  	'Source/PerformanceMultiSpec.h'
  ]

  s.framework = "XCTest"
  s.source_files = 'Source/*'
  s.pod_target_xcconfig = { 'ENABLE_BITCODE' => 'NO' }
end

