# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple_circuit/version'

Gem::Specification.new do |spec|
  spec.name          = "simple_circuit"
  spec.version       = SimpleCircuit::VERSION
  spec.authors       = ["Ryan Frantz"]
  spec.email         = ["ryanleefrantz@gmail.com"]
  spec.description   = %q{A little gem to help calculate the properties of a simple electrical circuit.}
  spec.summary       = %q{A little gem to help calculate the properties of a simple electrical circuit.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
