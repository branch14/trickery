require 'bundler/setup'
Bundler.setup

require File.expand_path(File.join(%w(.. .. lib trickery)), __FILE__)
require 'wrong/adapters/rspec'

RSpec.configure do |config|
  # some (optional) config here
end
