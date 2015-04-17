$:.push File.expand_path('../lib', __FILE__)
require 'acts_as_token/version'

Gem::Specification.new do |s|
  s.name        = 'acts_as_token'
  s.version     = ActsAsToken::VERSION
  s.date        = '2015-04-17'
  s.summary     = "A unique random token generator for rails app"
  s.description = "A unique random token generator for rails app"
  s.authors     = ["Paresh Gupta"]
  s.email       = 'paresh.gupta1408@gmail.com'
  s.files       = `git ls-files`.split("\n")
  s.homepage    = 'https://github.com/PareshGupta/acts_as_token'
  s.license     = 'MIT'
end
