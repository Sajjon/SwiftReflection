Pod::Spec.new do |s|
  s.name = 'SwiftReflection'
  s.version = '0.1.0'
  s.license = 'Apache'
  s.summary = 'Retreive type and name of properties of an NSObject class'
  s.homepage = 'https://github.com/Sajjon/SwiftReflection'
  s.authors = { 'Sajjon' => 'alex.cyon@gmail.com' }
  s.source = { :git => 'https://github.com/Sajjon/SwiftReflection.git', :tag => s.version }

  s.ios.deployment_target = '8.0'

  s.source_files = 'SwiftReflection/*.swift'
end