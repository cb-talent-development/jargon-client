# encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jargon/version'

Gem::Specification.new do |spec|
  spec.name = 'jargon-client'
  spec.version = Jargon::VERSION
  spec.authors = ['Alex Tharp', 'Bennett Goble', 'Colin Ewen', 'Siva Gopu']
  spec.email = %w(toastercup@gmail.com nivardus@gmail.com colin@draecas.com sivakumar.gopu@gmail.com)
  spec.summary = 'Jargon API Client'
  spec.homepage = 'https://github.com/cb-talent-development/jargon-client'
  spec.license = 'MIT'

  spec.files = `git ls-files`.split($/).reject { |f| f == '.gitignore' }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'mocha'
  spec.add_development_dependency 'codeclimate-test-reporter'

  spec.add_dependency 'faraday', '~> 0.9'
  spec.add_dependency 'faraday_middleware', '~> 0.9.1'
  spec.add_dependency 'oauth2', '~>1.0'

end
