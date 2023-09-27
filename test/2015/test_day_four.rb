# frozen_string_literal: true

require "minitest/autorun"
require_relative "../../src/2015/day_four"

class TestDayFour2015 < Minitest::Test
  def test_part_one
    skip "too expensive"
    result = DayFour2015.part_one("iwrupvqb")

    assert_equal 346_386, result
  end

  def test_part_two
    skip "too expensive"
    result = DayFour2015.part_two("iwrupvqb")

    assert_equal 9_958_218, result
  end
end
