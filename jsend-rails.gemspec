# -*- encoding: utf-8 -*-
require File.expand_path('../lib/jsend-rails/version', __FILE__)

Gem::Specification.new do |s|
  s.name = 'jsend-rails'
  s.version = JSend::Rails::VERSION.dup
  s.authors = ['Brian Moseley']
  s.email = ['bcm@copious.com']
  s.homepage = 'http://github.com/utahstreetlabs/jsend-rails'
  s.description = 'Extensions to Rails 3 for rendering JSend responses'
  s.summary = 'Extends Rails 3 to render JSON responses in the JSend format'

  s.add_dependency "rails", "~> 3.0"
  s.add_development_dependency('rspec')

  s.require_path = 'lib'
  s.files = Dir.glob("{bin,lib}/**/*") + %w(README.md)
end
