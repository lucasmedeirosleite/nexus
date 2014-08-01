# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nexus/version'

Gem::Specification.new do |spec|
  spec.name          = "nexus"
  spec.version       = Nexus::VERSION
  spec.authors       = ["Lucas Medeiros Leite"]
  spec.email         = ["lucastoc@gmail.com"]
  spec.summary       = %q{Socket communication lib}
  spec.description   = %q{Socket communication lib that handle communication between tcp clients and tcp server}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "json", "1.8.1"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry", "0.9.12"
  spec.add_development_dependency "pry-byebug", "1.3.2"
  spec.add_development_dependency "rspec", "2.14.1"

end
