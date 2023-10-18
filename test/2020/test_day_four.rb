# frozen_string_literal: true

require_relative "../../src/2020/day_four"
require "minitest/autorun"

class TestDayFour2020 < Minitest::Test
  def setup
    @lines = File.open("inputs/2020/day_four.in").readlines.join.split("\n\n")
  end

  def test_part_one
    result = DayFour2020.part_one(@lines)

    assert_equal 222, result
  end

  def test_part_two
    result = DayFour2020.part_two(@lines)

    assert_equal 140, result
  end
end
