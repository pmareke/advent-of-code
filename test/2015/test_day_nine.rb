# frozen_string_literal: true

require_relative "../../src/2015/day_nine"

class TestDayNine2015 < Minitest::Test
  def setup
    @input = File.open("inputs/2015/day_nine.in").readlines.map(&:strip)
  end

  def test_part_one
    result = DayNine2015.part_one(@input)

    assert_equal 251, result
  end

  def test_part_two
    result = DayNine2015.part_two(@input)

    assert_equal 898, result
  end
end
