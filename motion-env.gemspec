# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = "motion-env"
  s.version     = "0.0.4"
  s.authors     = ["Clay Allsopp"]
  s.email       = ["clay@usepropeller.com"]
  s.homepage    = "https://github.com/usepropeller/motion-env"
  s.summary     = "Add things to ENV in RubyMotion"
  s.description = "Add things to ENV in RubyMotion"

  s.files         = `git ls-files`.split($\)
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]
  s.license = 'MIT'

  s.add_development_dependency 'rake'
end