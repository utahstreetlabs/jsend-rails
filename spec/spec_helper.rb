require 'rubygems'
require 'bundler/setup'
require 'rspec'

Dir["./spec/support/**/*.rb"].each { |file| require file }
