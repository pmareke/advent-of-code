# frozen_string_literal: true

require_relative "../../src/2023/day_five"
require "minitest/autorun"

class TestDayFive2023 < Minitest::Test
  def test_part_one
    @lines = File.read("inputs/2023/day_five.in")
    result = DayFive2023.part_one(@lines)

    assert_equal 313_045_984, result
  end

  def test_part_two
    @lines = File.readlines("inputs/2023/day_five.in").map(&:chomp)
    result = DayFive2023.part_two(@lines)

    assert_equal 0, result
  end
end
