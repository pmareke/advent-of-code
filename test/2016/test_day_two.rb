# frozen_string_literal: true

require_relative "../../src/2016/day_two"
require "minitest/autorun"

class TestDayTwo2016 < Minitest::Test
  def setup
    @lines = File.open("inputs/2016/day_two.in").readlines
  end

  def test_part_one
    result = DayTwo2016.part_one(@lines)

    assert_equal 1985, result
  end

  def test_part_two
    result = DayTwo2016.part_two(@lines)

    assert_equal "5DB3", result
  end
end
