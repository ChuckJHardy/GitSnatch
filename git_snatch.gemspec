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

  spec.add_dependency "curb"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency "vcr"
end
