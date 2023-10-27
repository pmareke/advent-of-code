# frozen_string_literal: true

require_relative "../../src/2018/day_five"

class TestDayFive2018 < Minitest::Test
  def setup
    @lines = File.open("inputs/2018/day_five.in").readlines.first
  end

  def test_part_one
    result = DayFive2018.part_one(@lines)

    assert_equal 10_886, result
  end

  def test_part_two
    result = DayFive2018.part_two(@lines)

    assert_equal 4684, result
  end
end
