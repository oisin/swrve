require 'coveralls'
require 'simplecov'
if ENV['TRAVIS']
  Coveralls.wear!
else
  SimpleCov.start
end

require 'mocha/api'
require 'rspec'
GEM_ROOT = File.expand_path('../../', __FILE__)
$:.unshift File.join(GEM_ROOT, 'lib')
require 'swrve'

RSpec.configure do |config|
    config.raise_errors_for_deprecations!
    config.mock_framework = :mocha
end

