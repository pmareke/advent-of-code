require "minitest/autorun"
require_relative "../../src/2015/day_five"

class TestDayFive2015 < Minitest::Test
  def setup
    @lines = File.open("inputs/2015/day_five.in")
  end

  def test_part_one
    result = DayFive2015::part_one(@lines)

    assert_equal 238, result
  end

  def test_part_two
    result = DayFive2015::part_two(@lines)

    assert_equal 69, result
  end
end
