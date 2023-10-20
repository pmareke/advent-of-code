# frozen_string_literal: true

require_relative "../../src/2016/day_three"

class TestDayThree2016 < Minitest::Test
  def setup
    @lines = File.open("inputs/2016/day_three.in").readlines
  end

  def test_part_one
    result = DayThree2016.part_one(@lines)

    assert_equal 983, result
  end

  def test_part_two
    result = DayThree2016.part_two(@lines)

    assert_equal 1836, result
  end
end
