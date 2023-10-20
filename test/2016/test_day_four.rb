# frozen_string_literal: true

require_relative "../../src/2016/day_four"

class TestDayFour2016 < Minitest::Test
  def setup
    @lines = File.open("inputs/2016/day_four.in").readlines
  end

  def test_part_one
    result = DayFour2016.part_one(@lines)

    assert_equal 361_724, result
  end

  def test_part_two
    result = DayFour2016.part_two(@lines)

    assert_equal 482, result
  end
end
