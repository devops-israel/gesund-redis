# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gesund/redis/version'

Gem::Specification.new do |spec|
  spec.name          = "gesund-redis"
  spec.version       = Gesund::Redis::VERSION
  spec.authors       = ["Evgeny Zislis"]
  spec.email         = ["evgeny@devops.co.il"]
  spec.description   = %q{Plugin for Gesund health checker to check Redis health}
  spec.summary       = %q{Redis health checks for Gesund}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_runtime_dependency "gesund", "~> 0.0.3"
  spec.add_runtime_dependency "redis"
end
