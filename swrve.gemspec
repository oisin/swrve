# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'swrve/version'

Gem::Specification.new do |gem|
  gem.name          = 'swrve'
  gem.version       = Swrve::VERSION
  gem.authors       = ["John O'Gara","Oisin Hurley"]
  gem.email         = ['johnogara@radiatorhead.com',"oisin.hurley@gmail.com"]
  gem.description   = %q{Simple Client for Swrve API}
  gem.summary       = %q{}
  gem.homepage      = 'https://github.com/johnogara/swrve'

#   gem.add_dependency 'faraday', ['~> 0.8', '< 0.10']
#   gem.add_dependency 'faraday_middleware', ['~> 0.8', '< 0.10']
#   gem.add_dependency 'multi_json', '~> 1.0'

  gem.add_dependency 'faraday', '~> 0.15.4'
  gem.add_dependency 'faraday_middleware', '~> 0.13'
  gem.add_dependency 'multi_json', '~> 1.13'

  gem.add_development_dependency 'bundler'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'mocha'
  gem.add_development_dependency 'guard'
  gem.add_development_dependency 'guard-rspec'
  gem.add_development_dependency 'guard-bundler'
  gem.add_development_dependency 'guard-ctags-bundler'
  gem.add_development_dependency 'yard'
  gem.add_development_dependency 'redcarpet'
  gem.add_development_dependency 'github-markup'


  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']
end
