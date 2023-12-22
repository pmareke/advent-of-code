# frozen_string_literal: true

require_relative "../../src/2015/day_eight"

class TestDayEight2015 < Minitest::Test
  def setup
    @lines = File.open("inputs/2015/day_eight.in").readlines.map(&:strip)
  end

  def test_part_one
    result = DayEight2015.part_one(@lines)

    assert_equal 1371, result
  end

  def test_part_two
    result = DayEight2015.part_two(@lines)

    assert_equal 2117, result
  end
end
