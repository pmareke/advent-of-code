# frozen_string_literal: true

require_relative "../../src/2015/day_three"

class TestDayThree2015 < Minitest::Test
  def setup
    @instructions = File.open("inputs/2015/day_three.in").readlines.first.strip.chars
  end

  def test_part_one
    result = DayThree2015.part_one(@instructions)

    assert_equal 2565, result
  end

  def test_part_two
    result = DayThree2015.part_two(@instructions)

    assert_equal 2639, result
  end
end
