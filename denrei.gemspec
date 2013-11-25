# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'denrei/version'

Gem::Specification.new do |spec|
  spec.name          = "denrei"
  spec.version       = Denrei::VERSION
  spec.authors       = ["tbpgr"]
  spec.email         = ["tbpgr@tbpgr.jp"]
  spec.description   = %q{Denrei shows Ruby/Tk-Dialog with your favorite titile & message.}
  spec.summary       = %q{Denrei shows Ruby/Tk-Dialog with your favorite titile & message.}
  spec.homepage      = "https://github.com/tbpgr/denrei"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "thor", "~> 0.18.1"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.14.1"
end
