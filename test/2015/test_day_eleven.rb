# frozen_string_literal: true

require_relative "../../src/2015/day_eleven"
require "minitest/pride"
require "minitest/autorun"

class TestDayEleven2015 < Minitest::Test
  def setup
    @instructions = File.open("inputs/2015/day_eleven.in").readlines.first.strip
  end

  def test_part_one
    result = DayEleven2015.part_one(@instructions)

    assert_equal "hxbxxyzz", result
  end

  def test_part_two
    result = DayEleven2015.part_two(@instructions)

    assert_equal "hxcaabcc", result
  end
end
