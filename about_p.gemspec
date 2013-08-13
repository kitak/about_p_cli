# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'about_p/version'

Gem::Specification.new do |spec|
  spec.name          = "about_p"
  spec.version       = AboutP::VERSION
  spec.authors       = ["Keisuke KITA"]
  spec.email         = ["kei.kita2501@gmail.com"]
  spec.description   = %q{Fuzzy string searching at about p}
  spec.summary       = %q{Fuzzy string searching at about p}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
