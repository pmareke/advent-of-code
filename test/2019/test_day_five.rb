# frozen_string_literal: true

require_relative "../../src/2019/day_five"
require "minitest/autorun"

class TestDayFive2019 < Minitest::Test
  def setup
    @numbers = File.open("inputs/2019/day_five.in").readlines.first.split(",").map(&:to_i)
  end

  def test_part_one
    result = DayFive2019.part_one(@numbers)

    assert_equal 5_821_753, result
  end

  def test_part_two
    result = DayFive2019.part_two(@numbers)

    assert_equal 11_956_381, result
  end
end
