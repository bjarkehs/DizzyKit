Pod::Spec.new do |s|
  s.name         = 'DizzyKit'
  s.version      = '1.0.1'
  s.summary      = 'Simple animation library that allows you to easily animate things'

  s.description  = <<-DESC
                   DizzyKit removes a lot of boilerplate code for simple animations,
                   while staying extendable.
                   DESC

  s.homepage     = 'https://github.com/bjarkehs/DizzyKit'
  s.license      = 'MIT'
  s.author       = { 'Bjarke Hesthaven Søndergaard' => 'bhsgaard@gmail.com' }

  s.ios.deployment_target = '8.0'

  s.source       = { :git => 'https://github.com/bjarkehs/DizzyKit.git', :tag => "#{s.version}" }

  s.source_files = 'Sources/**/*.{swift}'
end
