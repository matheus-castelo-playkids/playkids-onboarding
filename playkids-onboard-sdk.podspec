Pod::Spec.new do |spec|
  spec.name = "playkids-onboard-sdk"
  spec.version = "1.0.0"
  spec.summary = "Sample framework for onBoarding purposes on PlayKids"
  spec.homepage = "https://github.com/kaio-silva-playkids/playkids-onboarding.git"
  
  spec.license = {
    :type => 'Copyright',
    :text => <<-LICENSE
      Copyright 2018 Movile. All rights reserved.
      LICENSE
  }

  spec.authors = { "Matheus C" => 'matheus.castelo@playkids.com' }

  spec.swift_version = "4.0"
  spec.platform = :ios, "9.1"
  spec.requires_arc = true
  spec.source = { git: "https://github.com/kaio-silva-playkids/playkids-onboarding.git", tag: "v#{spec.version}", submodules: true }
  spec.source_files = "playkids-onboard-sdk/**/*.{h,swift}"
  
  spec.dependency "Alamofire", "~> 4.7.1"
end