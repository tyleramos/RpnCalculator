# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rpn_calculator/version'

Gem::Specification.new do |spec|
  spec.name          = "rpn_calculator"
  spec.version       = RpnCalculator::VERSION
  spec.authors       = ["Tyler Amos"]
  spec.email         = ["tyler.amos712@gmail.com"]

  spec.summary       = %q{A reverse polish notation style calculator.}
  spec.description   = %q{A reverse polish notation style calculator.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
