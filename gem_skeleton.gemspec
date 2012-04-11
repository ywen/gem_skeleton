# -*- encoding: utf-8 -*-
require File.expand_path('../lib/gem_skeleton/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Yi Wen"]
  gem.email         = ["hayafirst@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "gem_skeleton"
  gem.require_paths = ["lib"]
  gem.version       = GemSkeleton::VERSION
  gem.add_runtime_dependency(%q<thor>)
  gem.add_runtime_dependency(%q<bundler>)
end
