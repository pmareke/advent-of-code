# frozen_string_literal: true

require_relative "../../src/2023/day_fourteen"
require "minitest/autorun"

class TestDayFourteen2023 < Minitest::Test
  def setup
    file = "inputs/2023/day_fourteen.in"
    @lines = File.read(file)
  end

  def test_part_one
    result = DayFourteen2023.part_one(@lines)

    assert_equal 0, result
  end

  def test_part_two
    result = DayFourteen2023.part_two(@lines)

    assert_equal 0, result
  end
end
