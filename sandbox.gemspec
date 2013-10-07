# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "sandbox/version"

Gem::Specification.new do |spec|
  spec.name          = "sandbox"
  spec.version       = Sandbox::VERSION
  spec.authors       = ["Jon Wheeler"]
  spec.email         = ["jon@doejo.com"]
  spec.description   = %q{CLI for Sandbox}
  spec.summary       = %q{Create, Destroy and Manage Sandbox VMs from the command line}
  spec.homepage      = "https://github.com/jonwheeler/sandbox"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rest-client",            "~> 1.6"
  spec.add_dependency "terminal_helpers",       "~> 0.1"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec",   "~> 2.14"
end
