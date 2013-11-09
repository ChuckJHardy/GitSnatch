# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'git_snatch/version'

Gem::Specification.new do |spec|
  spec.name          = "git_snatch"
  spec.version       = GitSnatch::VERSION
  spec.authors       = ["Chuck J hardy"]
  spec.email         = ["chuckjhardy@gmail.com"]
  spec.description   = %q{Grab content from a file with a github commit sha}
  spec.summary       = %q{Grab content from a file with a github commit sha. Simple and lightweight.}
  spec.homepage      = "https://github.com/ChuckJHardy/GitSnatch"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "curb", "~> 0.8.5"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "simplecov", "~> 0.7.1"
  spec.add_development_dependency "rspec", "~> 2.13.0"
  spec.add_development_dependency 'webmock', '~> 1.15.2'
  spec.add_development_dependency "vcr", "~> 2.7.0"
end
