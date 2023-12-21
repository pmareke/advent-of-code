# frozen_string_literal: true

require_relative "test/test_helper"

Dir.glob("test/*/test_day_*.rb") do |file|
  require "#{File.dirname(__FILE__)}/#{file}"
end
