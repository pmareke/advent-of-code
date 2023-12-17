# frozen_string_literal: true

require "minitest/pride"
require "minitest/autorun"

Dir.glob("test/*/test_day_*.rb") do |file|
  require "#{File.dirname(__FILE__)}/#{file}"
end
