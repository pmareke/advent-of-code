# frozen_string_literal: true

require_relative "../../src/2017/day_one"

class TestDayOne2017 < Minitest::Test
  def setup
    @numbers = File.open("inputs/2017/day_one.in").readlines.first.strip.chars.map(&:to_i)
  end

  def test_part_one
    result = DayOne2017.part_one(@numbers)

    assert_equal 1203, result
  end

  def test_part_two
    result = DayOne2017.part_two(@numbers)

    assert_equal 1146, result
  end
end
