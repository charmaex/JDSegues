Pod::Spec.new do |s|
  s.name         = "JDSegues"
  s.version      = "0.2.3"
  s.summary      = "Segues to reuse."
  s.homepage     = "http://jandamm.de"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Jan Dammshäuser" => "jandammshaeuser@me.com" }
  s.platform     = :ios
  s.ios.deployment_target = '8.0'
  s.source       = { :git => "https://github.com/charmaex/JDSegues.git", :tag => "#{s.version}" }
  s.requires_arc = true

  s.source_files  = "JDSegues/**/*.{swift}"
end
