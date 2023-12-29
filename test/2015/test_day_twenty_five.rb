# frozen_string_literal: true

require_relative "../../src/2015/day_twenty_five"

class TestDayTwentyFive2015 < Minitest::Test
  def setup
    @instruction = File.open("inputs/2015/day_twenty_five.in").readlines.first
  end

  def test_part_one
    result = DayTwentyFive2015.part_one(@instruction)

    assert_equal 8_997_277, result
  end
end
