# frozen_string_literal: true

require 'simplecov'
SimpleCov.start do
  enable_coverage :branch
end

require_relative '../lib/documentbuilder_script_generator'
