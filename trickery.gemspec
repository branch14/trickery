# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'trickery/version'

Gem::Specification.new do |spec|
  spec.name          = "trickery"
  spec.version       = Trickery::VERSION
  spec.authors       = ["phil"]
  spec.email         = ["phil@branch14.org"]
  spec.description   = %q{Reusable ruby trickery.}
  spec.summary       = %q{Reusable ruby trickery.}
  spec.homepage      = "https://github.com/branch14/trickery"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "wrong"

  spec.add_dependency "systemu"
end
