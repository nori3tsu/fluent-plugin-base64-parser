# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "fluent-plugin-base64-parser"
  spec.version       = "0.0.4"
  spec.authors       = ["nori3tsu"]
  spec.email         = ["tugend.licht@gmail.com"]

  spec.summary       = %q{Fluentd plugin to suppor Base64 format for parsing logs.}
  spec.homepage      = "https://github.com/nori3tsu/fluent-plugin-base64-parser"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "test-unit"
  spec.add_development_dependency("rr", ">= 1.0.0")
  spec.add_development_dependency("test-unit-rr", "~> 1.0.3")
  spec.add_runtime_dependency "fluentd", ">= 0.12.0", "< 0.14.0"
end
