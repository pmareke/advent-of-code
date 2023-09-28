# frozen_string_literal: true

require_relative "../../src/2021/day_two"

class TestDayTwo2021 < Minitest::Test
  def setup
    @lines = File.open("inputs/2021/day_two.in").map(&:split)
  end

  def test_part_one
    result = DayTwo2021.part_one(@lines)

    assert_equal 1_815_044, result
  end

  def test_part_two
    result = DayTwo2021.part_two(@lines)

    assert_equal 1_739_283_308, result
  end
end
