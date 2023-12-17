# frozen_string_literal: true

require_relative "../../src/2023/day_seventeen"
require "minitest/autorun"

class TestDaySeventeen2023 < Minitest::Test
  def setup
    file = "inputs/2023/day_seventeen.in"
    @lines = File.open(file).readlines.map(&:strip)
  end

  def test_part_one
    skip("Too Slow")
    result = DaySeventeen2023.part_one(@lines)

    assert_equal 1099, result
  end

  def test_part_two
    skip("Too Slow")
    result = DaySeventeen2023.part_two(@lines)

    assert_equal 1266, result
  end
end
