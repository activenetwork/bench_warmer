# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bench_warmer/version'

Gem::Specification.new do |spec|
  spec.name          = "bench_warmer"
  spec.version       = BenchWarmer::VERSION
  spec.authors       = ["Richard Steen"]
  spec.email         = ["richard.steen@activenetwork.com"]
  spec.summary       = %q{Benchmarks all of your urls}
  spec.description   = %q{Benchmarks all of your urls}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "httparty"
end
