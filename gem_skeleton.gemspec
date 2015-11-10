# -*- encoding: utf-8 -*-
Gem::Specification.new do |gem|
  gem.authors       = ["Yi Wen"]
  gem.email         = ["hayafirst@gmail.com"]
  gem.description   = %q{A command that make a gem skeleton with rspec in place}
  gem.summary       = %q{The command copies part of bundle gem code and add rspec and rvmrc support into the gem skeleton}
  gem.homepage      = "https://github.com/ywen/gem_skeleton"

  gem.files         = `git ls-files`.split($\)
  gem.license       = "MIT"
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "gem_skeleton"
  gem.require_paths = ["lib"]
  gem.version       = "0.1.6"
  gem.add_runtime_dependency(%q<thor>)
  gem.add_development_dependency(%q<rake>)
end
