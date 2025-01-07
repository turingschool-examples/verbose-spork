# frozen_string_literal: true

require 'simplecov'
SimpleCov.start do
  enable_coverage :branch
end
require 'pry'
require 'rspec'

require_relative '../lib/candidate'
require_relative '../lib/election'
require_relative '../lib/race'

RSpec.configure(&:disable_monkey_patching!)
