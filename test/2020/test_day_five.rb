# frozen_string_literal: true

require_relative "../../src/2020/day_five"
require "minitest/autorun"

class TestDayFive2020 < Minitest::Test
  def setup
    @lines = File.open("inputs/2020/day_five.in").readlines
  end

  def test_part_one
    result = DayFive2020.part_one(@lines)

    assert_equal 858, result
  end

  def test_part_two
    result = DayFive2020.part_two(@lines)

    assert_equal 557, result
  end
end
