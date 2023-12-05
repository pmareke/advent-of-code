# frozen_string_literal: true

require_relative "../../src/2023/day_five"
require "minitest/autorun"

class TestDayFive2023 < Minitest::Test
  def setup
    @lines = File.read("inputs/2023/day_five.in")
  end

  def test_part_one
    result = DayFive2023.part_one(@lines)

    assert_equal 313_045_984, result
  end

  def test_part_two
    result = DayFive2023.part_two(@lines)

    assert_equal 20_283_860, result
  end
end
