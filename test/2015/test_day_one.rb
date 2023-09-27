# frozen_string_literal: true

require_relative "../../src/2015/day_one"

class TestDayOne2015 < Minitest::Test
  def setup
    @parenthesis = File.open("inputs/2015/day_one.in").readlines.first.chars
  end

  def test_part_one
    result = DayOne2015.part_one(@parenthesis)

    assert_equal 280, result
  end

  def test_part_two
    result = DayOne2015.part_two(@parenthesis)

    assert_equal 1797, result
  end
end
