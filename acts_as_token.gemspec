$:.push File.expand_path('../lib', __FILE__)
require 'acts_as_token/version'

Gem::Specification.new do |s|
  s.name        = 'acts_as_token'
  s.version     = ActsAsToken::VERSION
  s.date        = '2015-03-10'
  s.summary     = "A random token generator"
  s.description = "A random token generator"
  s.authors     = ["Paresh Gupta"]
  s.email       = 'paresh.gupta1408@gmail.com'
  s.files       = `git ls-files`.split('\n')
  # s.homepage    =
  #   'http://rubygems.org/gems/acts_as_token'
  s.license       = 'MIT'
end