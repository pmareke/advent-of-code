# frozen_string_literal: true

require_relative "../../src/2018/day_four"
require "minitest/autorun"

class TestDayFour2018 < Minitest::Test
  def setup
    @lines = File.open("inputs/2018/day_four.in").readlines.map(&:strip)
  end

  def test_part_one
    result = DayFour2018.part_one(@lines)

    assert_equal 3212, result
  end

  def test_part_two
    result = DayFour2018.part_two(@lines)

    assert_equal 4966, result
  end
end
