Pod::Spec.new do |s|
  s.name             = 'Loggie'
  s.version          = '0.0.1'
  s.summary          = 'A short description of Loggie.'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/filipbec/Loggie'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Filip Beć' => 'filip.bec@gmail.com' }
  s.source           = { :git => 'https://github.com/filipbec/Loggie.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/infinumco'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Loggie/Classes/**/*.{swift}'
  s.resources = [
    'Loggie/Classes/**/*.{storyboard}',
    'Loggie/Classes/**/*.{xib}'
  ]

  s.frameworks = 'UIKit'
end
