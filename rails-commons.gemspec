$:.push File.expand_path('../lib', __FILE__)
require 'rails-commons/version'

Gem::Specification.new do |s|
  s.platform     = Gem::Platform::RUBY
  s.name         = 'rails-commons'
  s.version      = RailsCommons::VERSION
  s.summary      = 'Common Rails code'
  s.description  = 'Provides code commonly used in Rails applications'
  s.license      = 'MIT'

  s.author = 'Pawel Niewiadomski'
  s.email = '11110000b@gmail.com'
  s.homepage = 'https://pawelniewiadomski.com'

  s.required_ruby_version = '>= 2'

  s.files = Dir['CHANGELOG', 'README.md', 'MIT-LICENSE', 'lib/**/*']
  s.require_path = 'lib'

  s.add_dependency('gibbon', '>= 3.4.4')

  s.add_development_dependency('rake')
  s.add_development_dependency('rack', '~> 2.1.4')
  s.add_development_dependency('loofah', '~> 2.3.1')
  s.add_development_dependency('activerecord', '>= 4.1.0')
  s.add_development_dependency('bundler')
  s.add_development_dependency('generator_spec')
  s.add_development_dependency('rspec')
end
