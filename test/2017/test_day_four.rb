# frozen_string_literal: true

require_relative "../../src/2017/day_four"
require "minitest/autorun"

class TestDayFour2017 < Minitest::Test
  def setup
    @lines = File.open("inputs/2017/day_four.in").readlines
  end

  def test_part_one
    result = DayFour2017.part_one(@lines)

    assert_equal 455, result
  end

  def test_part_two
    result = DayFour2017.part_two(@lines)

    assert_equal 186, result
  end
end
