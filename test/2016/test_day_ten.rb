# frozen_string_literal: true

require_relative "../../src/2016/day_ten"
require "minitest/pride"
require "minitest/autorun"

class TestDayTen2016 < Minitest::Test
  def setup
    @lines = File.open("inputs/2016/day_ten.in").readlines.map(&:strip)
  end

  def test_part_one
    result = DayTen2016.part_one(@lines)

    assert_equal 101, result
  end

  def test_part_two
    result = DayTen2016.part_two(@lines)

    assert_equal 37_789, result
  end
end
