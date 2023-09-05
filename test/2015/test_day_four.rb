require "minitest/autorun"
require_relative "../../src/2015/day_four"

class TestDayFour2015 < Minitest::Test
  def test_part_one
    skip
    result = DayFour2015::part_one("iwrupvqb")

    assert_equal 346386, result
  end

  def test_part_two
    skip
    result = DayFour2015::part_two("iwrupvqb")

    assert_equal 9958218, result
  end
end
