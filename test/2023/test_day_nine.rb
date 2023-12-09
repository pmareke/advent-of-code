# frozen_string_literal: true

require_relative "../../src/2023/day_nine"
require "minitest/autorun"

class TestDayNine2023 < Minitest::Test
  def setup
    file = "inputs/2023/day_nine.in"
    @lines = File.readlines(file).map(&:strip)
  end

  def test_part_one
    result = DayNine2023.part_one(@lines)

    assert_equal 1_939_607_039, result
  end

  def test_part_two
    result = DayNine2023.part_two(@lines)

    assert_equal 1041, result
  end
end
