# frozen_string_literal: true

require_relative "../../src/2017/day_five"
require "minitest/autorun"

class TestDayFive2017 < Minitest::Test
  def setup
    @lines = File.open("inputs/2017/day_five.in").readlines
  end

  def test_part_one
    result = DayFive2017.part_one(@lines)

    assert_equal 360_603, result
  end

  def test_part_two
    result = DayFive2017.part_two(@lines)

    assert_equal 25_347_697, result
  end
end
