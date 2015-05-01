# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pairing_with_nick/version'

Gem::Specification.new do |spec|
  spec.name          = "pairing_with_nick"
  spec.version       = PairingWithNick::VERSION
  spec.authors       = ["Nick VanVoorthuysen", "Bobby Grayson"]
  spec.email         = [""]

  spec.summary       = %q{Get the reddit front page.}
  spec.description   = %q{see summary.}
  spec.homepage      = "https://github.com/NicholasJV/pairing_with_nick"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rspec"
  spec.add_runtime_dependency "mechanize"

end
